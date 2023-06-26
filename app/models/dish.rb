
class Dish < ApplicationRecord
  has_many :menu
  validates :name, :ingredients, presence: true
end
