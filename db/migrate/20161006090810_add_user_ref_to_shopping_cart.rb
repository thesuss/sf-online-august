class AddUserRefToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_carts, :user, foreign_key: true
  end
end
