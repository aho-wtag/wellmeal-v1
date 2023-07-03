
class MealAttendance < ApplicationRecord
  belongs_to :user

  enum meal_type: { lunch: 0, snack: 1 }
  validates :meal_date, presence: true
  validate :date_field_cannot_be_past

  private

  def date_field_cannot_be_past
    if date_field.present? && date_field < Date.today
      errors.add(:meal_date, "cannot be a past date")
    end
  end

end
