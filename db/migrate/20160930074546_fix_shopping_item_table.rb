class FixShoppingItemTable < ActiveRecord::Migration[5.0]
  def change
    change_table :shopping_cart_items do |t|
      t.shopping_cart_item_fields
    end
  end
end
