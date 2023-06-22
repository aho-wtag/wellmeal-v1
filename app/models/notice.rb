class Notice < ApplicationRecord
  belongs_to :user
  validates :email, :phone, :role, presence: true
end
