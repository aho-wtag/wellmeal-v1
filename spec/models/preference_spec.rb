# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Preference, type: :model do
  let(:user) { FactoryBot.create(:user, :user) }
  let(:preference) { FactoryBot.create(:preference, user:) }
  describe 'when creating' do
    it 'should be associated with an user' do
      expect(preference.user).to be_instance_of(User)
    end

    it 'should have a restricted_food' do
      should validate_presence_of(:restricted_food)
    end
  end
end
