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
end
