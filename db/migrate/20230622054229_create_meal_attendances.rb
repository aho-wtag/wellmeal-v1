# frozen_string_literal: true

class CreateMealAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_attendances do |t|
      t.integer :meal_type, null: false
      t.date :meal_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
