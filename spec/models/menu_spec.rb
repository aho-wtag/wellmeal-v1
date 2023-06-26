
require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:user) { FactoryBot.create(:user, :user) }
  let(:dish) { FactoryBot.create(:dish) }
  let(:menu) { FactoryBot.create(:menu, user:, dish:) }
  describe 'when creating ' do
    it 'should validate the presence of date' do
      should validate_presence_of(:meal_date)
    end

    it 'should be associated with an user and dish' do
      expect(menu.user).to be_instance_of(User)
      expect(menu.dish).to be_instance_of(Dish)
    end
  end
end
