json.restaurants @restaurants do |restaurant|
  json.id restaurant.id
  json.user_id restaurant.user_id
  json.name restaurant.name
  json.street restaurant.street
  json.zipcode restaurant.zipcode
  json.town restaurant.town
  json.description restaurant.description
  json.category restaurant.category
  json.latitude restaurant.latitude
  json.longitude restaurant.longitude
end
