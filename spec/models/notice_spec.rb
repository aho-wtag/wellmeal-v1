require 'rails_helper'

RSpec.describe Notice, type: :model do
  let(:notice) {FactoryBot.create(:notice)}

  describe 'when creating a notice' do
    it 'is associated with an user' do

      user = FactoryBot.create(:user,:user)
      notice = FactoryBot.create(:notice, user: user)
      expect(notice.user).to be_instance_of(User)
    end

    it 'should have a title' do
      should validate_presence_of(:notice_title)
    end
    it 'should have a notice body' do
      should validate_presence_of(:notice_body)
    end
    it 'should have a notice date' do
      should validate_presence_of(:created_at)
    end
  end
  end
