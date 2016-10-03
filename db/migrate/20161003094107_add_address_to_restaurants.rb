class AddAddressToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :street, :string
    add_column :restaurants, :zipcode, :integer
    add_column :restaurants, :town, :string
  end
end
