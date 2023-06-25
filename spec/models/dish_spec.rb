# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { FactoryBot.create(:dish) }

  describe 'When creating a Dish' do
    it 'should validate the presence of dish name' do
      should validate_presence_of(:name)
    end
    it 'should validate the presence of dish name' do
      should validate_presence_of(:ingredients)
    end
  end
end
