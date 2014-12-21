module ItemsHelper

def item_categories
[
   ['Landed Property'],
   ['Condominium'],
   ['Apartment']
]
end

def item_conditions
[
   ['Rough'],
   ['Fair'],
   ['Good'],
   ['Excellent'],
   ['Like New']
]
end

def name
  if params.has_key?(:category)
    "#{params[:category]}"
  else
    "Featured"
  end
end

def user_display(items)
  
  items.first.name
  
end

end
