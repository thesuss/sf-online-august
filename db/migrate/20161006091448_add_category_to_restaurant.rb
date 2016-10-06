class AddCategoryToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :category, :string
  end
end
