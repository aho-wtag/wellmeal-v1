# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { FactoryBot.create(:menu, :snack) }
  describe 'when creating ' do
    it 'should validate the presence of date' do
      should validate_presence_of(:meal_date)
    end

    it 'should be associated with an user and dish' do
      expect(menu.user).to be_instance_of(User)
    end
  end
end
