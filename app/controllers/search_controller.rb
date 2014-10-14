 # app/controllers/search_controller.rb

 class SearchController < ApplicationController

  before_filter :authenticate
  
  def new
      render 'new'
  end


 def index
      if(!params[:sort])
         sort_by = "Recently Available"

      else
         sort_by = params[:sort]
      end
          
       #Tests to see if a valid date has been entered
       begin
         params[:from] = Date.parse(params[:from])
       rescue
           params[:from] = Date.today
       end

      params.each do |key, value|   
        if(key == 'quantity')
          if(value == '' or value == nil or !is_a_number?(value) or value.to_f <0 or value.to_f >100000)
             params[key] =0
          else
            params[key] = value.to_f.floor
          end
        elsif(key == 'price') 
         if(value == '' or value == nil)
             params[key] = '%'
         elsif( !is_a_number?(value)or value.to_f <=0 or value.to_f >100000)
             params[key] = 100000
         end    

        elsif(key == 'weight')  
         if (value == ''  or value == nil ) 
             params[key] = '%'    
         elsif( !is_a_number?(value) or value.to_f <=0 or value.to_f >100000)
            params[key] =0
         end  
     
        elsif(value == '' or value == nil or value == "N0N3")    
                params[key] = '%' 
               
         end
      end

     
     
      @inventory = Array.new
     if(params[:search])  #search bar

       params[:search] = params[:search].downcase unless params[:search].blank?
           
       @inventory = simple_search(params[:search])
     
     else #advanced search

      if(params[:name].blank?)
        params[:name] = '%'
      else
        params[:name] = params[:name].downcase
      end

      if(params[:description].blank?)
        params[:description] = '%'
      else
        params[:description] = params[:description].downcase
      end

      if(params[:location].blank?)
        params[:location] = '%'
      else
        params[:location] = params[:location].downcase
      end

     @inventory = Item.where('name ILIKE ? AND description ILIKE ? AND category LIKE ?  AND available_from <= ? AND available_until >= ? AND quantity >= ?', "%#{params[:name]}%","%#{params[:description]}%",params[:category], params[:from],params[:from], params[:quantity])

           if(params[:condition])
             @condition_match = Array.new
             if(params[:condition] == '%' || params[:condition] == 'Rough') 
                 @condition_match = Item.where('condition LIKE ?','%')
             elsif(params[:condition] == 'Fair')
                 @condition_match = Item.where('condition LIKE ? OR condition LIKE ? OR condition LIKE ? OR condition LIKE ?','Like New','Excellent', 'Good', 'Fair')
             elsif(params[:condition] == 'Good')
                 @condition_match = Item.where('condition LIKE ? OR condition LIKE ? OR condition LIKE ?','Like New','Excellent', 'Good')
             elsif(params[:condition] == 'Excellent')
                 @condition_match = Item.where('condition LIKE ? OR condition LIKE ?','Like New','Excellent')
             elsif(params[:condition] == 'Like New')
                 @condition_match = Item.where('condition LIKE ?','Like New')
             end
             @inventory = @inventory & @condition_match
           end
           if(params[:price] != '%')
             @price_match = Item.where('price IS NOT NULL AND price <= ?', params[:price])
             @inventory = @inventory & @price_match 
          end

          if(params[:weight] != '%')
             @weight_match = Item.where('weight IS NOT NULL AND weight >= ?', params[:weight])
             @inventory = @inventory & @weight_match 
          end

          if(params[:location] != '%')
             @location_match = Array.new 
             @location = Array.new
             @locations = Location.where('address ILIKE ?',  "%"+params[:location]+ "%")
             @locations = @locations.map{|x| x.locatable_id}
            
                                
             Item.all.each do |i|
                 if (@locations.include?(i.id))
                     @location_match << i
                  end
             end            
              
             @inventory = @inventory & @location_match

              
          end
          


           
     end
        
     @inventory = search_sort(sort_by)
     @items = Kaminari.paginate_array(@inventory).page(params[:page]).per(9)

   
     respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @items }
     
     
     end

  end

   def simple_search(term)
   inv = Item.where('(name ILIKE ? OR description ILIKE ? OR category ILIKE ? OR condition ILIKE ?)  AND available_from <= ? AND available_until >= ?',"%#{term}%","%#{term}%","%#{term}%","%#{term}%",Date.today,Date.today) 
   location_match = Array.new 
   location = Array.new
   locations = Location.where('address ILIKE ?',  "%"+term+ "%")
   locations = locations.map{|x| x.locatable_id}
        Item.all.each do |i|
          if (locations.include?(i.id))
            location_match << i
          end
        end  
   return inv | location_match
    
  end

  def is_a_number?(s)
   s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
  end


   def search_sort(sort_by)
    
     if(sort_by == "Recently Available")
        @inventory.sort{|a,b| a.available_from <=> b.available_from} 
     elsif (sort_by == "Expiring Soon")
        @inventory.sort{|a,b| a.available_until <=> b.available_until} 
     elsif(sort_by == "Item Name")
        @inventory.sort{|a,b| a.name.downcase <=> b.name.downcase}
     elsif(sort_by == "User Name")
        @inventory.sort{|a,b| User.find(a.user_id).name.downcase <=> User.find(b.user_id).name.downcase} 
     else
        @inventory
     end

  end


end
