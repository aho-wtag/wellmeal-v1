# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :menu
  validates :name, :ingredients, presence: true
end
