# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :user
  validates :notice_body, :notice_title, presence: true
end
