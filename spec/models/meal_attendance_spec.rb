require 'rails_helper'

RSpec.describe MealAttendance, type: :model do
  let(:user) { FactoryBot.create(:user, :user) }
  let(:meal_attendance){FactoryBot.create(:meal_attendance, :lunch ,user: user)}

  describe 'when created' do
    it 'should be associated with an user' do
      expect(meal_attendance.user).to be_instance_of(User)
    end

    it 'should have Meal date' do
      should validate_presence_of(:meal_date)
    end

    it 'should have Meal date' do
      should validate_presence_of(:meal_type)
    end

    it 'should not allow PAST Meal date' do
      should_not allow_value(Date.yesterday).for(:meal_date)
    end

  end

end
