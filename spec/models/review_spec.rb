# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { FactoryBot.create(:user, :user) }
  let(:dish) { FactoryBot.create(:dish) }
  let(:menu) { FactoryBot.create(:menu, user:, dish:) }
  let(:review) { FactoryBot.create(:review, menu:, user:) }

  describe 'when creating' do
    it 'should be associated with an user' do
      expect(review.user).to be_instance_of(User)
    end

    it 'should be associated with an user' do
      expect(review.menu).to be_instance_of(Menu)
    end

    it 'should have a review body' do
      should validate_presence_of(:review_body)
    end
    it 'should have a rating' do
      should validate_presence_of(:rating)
    end
    it 'rating should be between 1 to 5' do
      should validate_numericality_of(:rating).only_integer.is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
    end
  end
end
