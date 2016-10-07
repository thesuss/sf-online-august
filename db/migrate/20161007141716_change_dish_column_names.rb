class ChangeDishColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :dishes, :dish_name, :name
    rename_column :dishes, :dish_desc, :description
    rename_column :dishes, :dish_price, :price
    rename_column :dishes, :dish_allergy, :allergies
    rename_column :dishes, :dish_cal, :calories
    rename_column :dishes, :dish_ingredients, :ingredients
  end
end
