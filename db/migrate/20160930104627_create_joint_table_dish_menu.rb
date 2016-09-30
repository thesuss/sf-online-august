class CreateJointTableDishMenu < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes_menus, id: false do |t|
      t.belongs_to :dish, index: true
      t.belongs_to :menu, index: true
    end
  end
end
