# frozen_string_literal: true

class MealAttendance < ApplicationRecord
  belongs_to :user

  validates :meal_date, :meal_type, :user_id, presence: true
  enum meal_type: { lunch: 0, snack: 1 }
  validate :future_date_validation

  def future_date_validation
    return unless meal_date.present? && meal_date < Date.today

    errors.add(:meal_date, 'must be a future date')
  end
end
