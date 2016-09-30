class AddMenuToDishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :menu, foreign_key: true
  end
end
