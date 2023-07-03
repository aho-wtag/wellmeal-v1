
class MealAttendance < ApplicationRecord
  belongs_to :user

  enum meal_type: { lunch: 0, snack: 1 }, presence:true
  validates :meal_date, presence: true, date: { after_or_equal_to: -> { Date.current } }

end
