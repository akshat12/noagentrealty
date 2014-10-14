module ItemsHelper

def item_categories
[
   ['Appliances'],
   ['Architectural'],
   ['Cabinets'],
   ['Electrical'],
   ['Exterior Doors'],
   ['Flooring'],
   ['Furniture'],
   ['Hardware'],
   ['Heating & Cooling'],
   ['Interior Doors'],
   ['Lumber'],
   ['Masonry, Tile & Stone'],
   ['Plumbing'],
   ['Tools'],
   ['Windows'],
   ['Other']
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
