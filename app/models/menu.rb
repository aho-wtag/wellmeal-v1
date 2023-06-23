class Menu < ApplicationRecord
  belongs_to :user
  has_one :review
  belongs_to :dish
end
