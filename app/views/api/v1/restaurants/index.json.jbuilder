json.restaurants @restaurants do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.description restaurant.description
  json.user_id restaurant.user_id
  json.street restaurant.street
  json.zipcode restaurant.zipcode
  json.town restaurant.town
  json.latitude restaurant.latitude
  json.longitude restaurant.longitude
  json.category restaurant.category

  if restaurant.has_menus? do |menu|
        json.id menu.id
        json.title menu.title
      end
    end
end
