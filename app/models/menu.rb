class Menu < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :dish

  enum meal_type:  { lunch: 0, snack: 1 }
  validates :user_id, :dish_id, :meal_date, presence: true
end
