# frozen_string_literal: true

class Menu < ApplicationRecord
  belongs_to :user
  has_one :review
  has_and_belongs_to_many :dish

  enum meal_type: { lunch: 0, snack: 1 }, presence: true
  validates  :meal_date, presence: true
end
