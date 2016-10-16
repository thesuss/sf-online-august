json.cart_id @cart.id
json.dishes(@cart.shopping_cart_items) do |item_record|
  json.name item_record.item.name
  json.price item_record.item.price
end
json.total @cart.total.to_i
json.message 'Your food is on its way!'
