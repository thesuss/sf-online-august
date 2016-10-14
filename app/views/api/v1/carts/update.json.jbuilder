json.cart_id @cart.id
json.dishes(@cart.shopping_cart_items) do |item_record|
  json.dish_id item_record.item.id
end
