class CreateJoinTableDishesMenus < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dishes, :menus do |t|
      t.index [:dish_id, :menu_id]
      t.index [:menu_id, :dish_id]
    end
  end
end
