class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.text :dish_desc
      t.integer :dish_price
      t.text :dish_allergy
      t.integer :dish_cal
      t.text :dish_ingredients

      t.timestamps
    end
  end
end
