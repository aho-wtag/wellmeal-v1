# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :user
  has_one :review
  has_and_belongs_to_many :dish

  enum meal_type: { lunch: 0, snack: 1 }
  validates  :meal_date, :meal_type, presence: true
end
