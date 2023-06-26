
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates :review_body, :user_id, :menu_id, presence: true
  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
