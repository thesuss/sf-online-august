class CreateShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_items do |t|

      t.timestamps
    end
  end
end
