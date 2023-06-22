class CreateMealAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_attendances do |t|
      t.integer :meal_type
      t.date :meal_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
