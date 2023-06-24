require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) {FactoryBot.create(:menu)}
  describe 'when creating ' do

    it 'should validate the presence of date' do
      should validate_presence_of(:meal_date)
    end

    it 'should be associated with an user and dish' do

      user = FactoryBot.create(:user,:user)
      dish= FactoryBot.create(:dish)
      menu = FactoryBot.create(:menu, user: user, dish: dish)
      expect(menu.user).to be_instance_of(User)
      expect(menu.dish).to be_instance_of(Dish)

    end


  end
end
