# frozen_string_literal: true

class Preference < ApplicationRecord
  belongs_to :user
  validates :restricted_food, :user_id, presence: true
end
