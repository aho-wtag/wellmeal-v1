# frozen_string_literal: true

class Preference < ApplicationRecord
  belongs_to :user
  validates :restricted_food, presence: true
end
