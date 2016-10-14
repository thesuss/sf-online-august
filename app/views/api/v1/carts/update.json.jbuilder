json.cart_id @cart.id
json.dishes(@cart.shopping_cart_items) do |item|
  json.dish_id item.id
  end