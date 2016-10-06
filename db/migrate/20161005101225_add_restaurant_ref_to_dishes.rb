class AddRestaurantRefToDishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :restaurant, foreign_key: true
  end
end
