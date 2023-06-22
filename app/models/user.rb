class User < ApplicationRecord
  has_many :menus
  has_many :preferences
  has_many :reviews
  has_many :meal_attendances
  has_many :notices
end
