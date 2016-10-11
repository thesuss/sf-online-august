json.id @restaurant.id
json.name @restaurant.name
json.description @restaurant.description
json.user_id @restaurant.user_id
json.street @restaurant.street
json.zipcode @restaurant.zipcode
json.town @restaurant.town
json.latitude @restaurant.latitude
json.longitude @restaurant.longitude
json.category @restaurant.category
json.menus(@restaurant.menus) do |menu|
  json.title menu.title
  json.dishes menu.dishes do |dish|
    json.dish dish.name
  end
end


