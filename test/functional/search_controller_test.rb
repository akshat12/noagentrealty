require 'test_helper'


#NOTE comment out 'before_filter :authenticate' in search controller to get tests to work

class SearchControllerTest < ActionController::TestCase
#Validation Tests
#--------------

#i)
test "Search01" do
    get(:index,{'name' => ";;@.,/w7SHJD",'description' => ";[#;[#;65 _(**)Sx",'quantity' => "",'condition' => "[];;]#~~~~!*!@()",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => ";2adfas3                      4",'category' => "hgsdsaf34:./]["} )      
    assert_response :success
    assert_equal 0,assigns(:inventory).count, "ERROR: Results found"
end


#ii) 
test "Search02" do
    get(:index,{'name' => "",'description' => "",'quantity' => 22323221399097864677535,'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#iii) 
test "Search03" do
    get(:index,{'name' => "",'description' => "",'quantity' => -12354524543523452344,'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"

end

#iv) 
test "Search04" do
    get(:index,{'name' => "",'description' => "",'quantity' => 12.344323453245,'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"

    
end

#v) 
test "Search05" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => 1000238282838312312131323,'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"

end

#vi) 
test "Search06" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => -1231231321123,'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"

end

#vii) 
test "Search07" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => 3.44545454,'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end


#viii) 
test "Search08" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => 22342042342398188913,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#ix) 
test "Search09" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => -237652675631,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"


end

#x) 
test "Search10" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => 12.231231,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    assert_equal 1,assigns(:inventory).count, "ERROR: Incorrect number of results found"
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('telephone cable'), "ERROR:Correct Item not found"
end

#xi) 
test "Search11" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "-201897983--34----223--03-24",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#xii) 
test "Search12" do
    get(:index,{'name' => "",'description' => "",'quantity' => "Asb",'condition' => "",'weight' => "sdfsf",'price' => "sdadf",'from' => "asfsdf",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"

end

#xiii) 
test "Search13" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => "",'sort' =>"aasdsaf"} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#Search Bar Tests
#--------------

#i)
test "Search14" do
    get(:index,{'search' => ""} )      
    assert_response :success
@results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#ii)
test "Search15" do
    get(:index,{'search' => "xxxxxx"} )      
    assert_response :success
    assert_equal [],assigns(:inventory), "ERROR: Items were found"
end

#iii)
test "Search16" do
    get(:index,{'search' => "SPIN"} )      
    assert_response :success
    assert_equal 1,assigns(:inventory).count, "ERROR: Incorrect number of results found"
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Office chair'), "ERROR:Correct Item not found"
end

#iv)
test "Search17" do
    get(:index,{'search' => "furniture"} )      
    assert_response :success
    assert_equal 2,assigns(:inventory).count, "ERROR: Incorrect number of results found"
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Office chair'), "ERROR:Correct Item not found"
    assert @results.include?('Wooden Chairs'), "ERROR:Correct Item not found"
end

#v)
test "Search18" do
    get(:index,{'search' => "chair"} )      
    assert_response :success
    assert_equal 2,assigns(:inventory).count, "ERROR: Incorrect number of results found"
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Office chair'), "ERROR:Correct Item not found"
    assert @results.include?('Wooden Chairs'), "ERROR:Correct Item not found"
end

#vi)
test "Search19" do
    get(:index,{'search' => "fair"} )      
    assert_response :success

    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('telephone cable'), "ERROR:Correct Item not found"
    assert @results.include?('Wooden Chairs'), "ERROR:Correct Item not found"
    assert_equal 2,assigns(:inventory).count, "ERROR: Incorrect number of results found"
end

#vii)
test "Search20" do
    get(:index,{'search' => "stone"} )      
    assert_response :success

    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('telephone cable'), "ERROR:Correct Item not found"
    assert @results.include?('Floor Boards'), "ERROR:Correct Item not found"
    assert @results.include?('Wooden Chairs'), "ERROR:Correct Item not found"
    assert_equal 3,assigns(:inventory).count, "ERROR: Incorrect number of results found"
end

#viii)
test "Search21" do
    get(:index,{'search' => "floor"} )      
    assert_response :success

    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('telephone cable'), "ERROR:Correct Item not found"
    assert @results.include?('Floor Boards'), "ERROR:Correct Item not found"
    assert @results.include?('Office chair'), "ERROR:Correct Item not found"
    assert_equal 3,assigns(:inventory).count, "ERROR: Incorrect number of results found"
end

#Advanced Search Tests
#---------------------

#i)
 test "Search22" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-12",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#ii)
test "Search23" do
    get(:index,{'name' => "chair",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
    
end

#iii)
test "Search24" do
    get(:index,{'name' => "",'description' => "Wooden",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#iv)
test "Search25" do
    get(:index,{'name' => "",'description' => "",'quantity' => 4,'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#v)
test "Search26" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "Good",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#vi)
test "Search27" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => 12,'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end
#vii)
test "Search28" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => 10,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#viii)
test "Search29" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "View",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert @results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#ix)
test "Search30" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => "Lumber"} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#x)
test "Search31" do
    get(:index,{'name' => "chair",'description' => "adjustable",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#xi)
test "Search32" do
    get(:index,{'name' => "",'description' => "",'quantity' => 3,'condition' => "Good",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#xii)
test "Search33" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => 4.43,'price' => 53.23,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#xiii)
test "Search34" do
    get(:index,{'name' => "",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "forest",'category' => "Furniture"} )      
    assert_response :success
  @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#xiv)
test "Search35" do
    get(:index,{'name' => "cable",'description' => "",'quantity' => "",'condition' => "",'weight' => "",'price' => 50,'from' => "2013-04-01",'location' => "",'category' => "Lumber"} )      
    assert_response :success
    assert_equal [],assigns(:inventory), "ERROR: Items were found" 
end

#xv)
test "Search36" do
    get(:index,{'name' => "",'description' => "",'quantity' => 1,'condition' => "",'weight' => 5,'price' => "",'from' => "2013-04-01",'location' => "Stone",'category' => ""} )      
    assert_response :success
    @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert @results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end

#xvi)
test "Search37" do
    get(:index,{'name' => "",'description' => "eight",'quantity' => "",'condition' => "Rough",'weight' => "",'price' => "",'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert !@results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert @results.include?('Office chair'), "ERROR:Office chair"
end

#xvii)
test "Search38" do
    get(:index,{'name' => "",'description' => "",'quantity' => 5,'condition' => "Fair",'weight' => 2,'price' => 50,'from' => "2013-04-01",'location' => "",'category' => ""} )      
    assert_response :success
   @results = assigns(:inventory).map{|x| x.name}
    assert @results.include?('Floor Boards'), "ERROR:Floor Boards"
    assert !@results.include?('Wooden Chairs'), "ERROR:Wooden Chairs"
    assert !@results.include?('telephone cable'), "ERROR:telephone"
    assert !@results.include?('Office chair'), "ERROR:Office chair"
end




end
