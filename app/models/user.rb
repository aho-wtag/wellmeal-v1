class User < ApplicationRecord
  has_many :preferences
  has_many :menus
  has_one :review, through: :menus
  has_many :meal_attendances
  has_many :notices
end
