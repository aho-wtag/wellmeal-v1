class Menu < ApplicationRecord
  belongs_to :user
  has_one :review
  has_many :dish
end
