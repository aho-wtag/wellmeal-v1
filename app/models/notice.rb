# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :user
  validates :notice_body, :user_id, :created_at, :notice_title, presence: true
end
