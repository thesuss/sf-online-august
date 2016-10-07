class AddStripeFieldsToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_carts, :stripe_customer, :string
    add_column :shopping_carts, :paid, :boolean, default: false
  end
end
