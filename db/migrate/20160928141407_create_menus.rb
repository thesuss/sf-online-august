class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string  :title, null: false, default: ""
      t.timestamps
    end
  end
end
