
class MealAttendance < ApplicationRecord
  belongs_to :user

  enum meal_type: { lunch: 0, snack: 1 }
  validates :meal_date, :meal_type,  presence: true
  validate :meal_date_cannot_be_past

  private

  def meal_date_cannot_be_past
    if meal_date.present? && meal_date < Date.today
      errors.add(:meal_date,"can't be in the past")
    end
  end
end
