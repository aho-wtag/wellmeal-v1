
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user, :user) }

  describe 'when creating a user' do
    it 'has a valid factory' do
      expect(user).to be_valid
    end
    it 'should validate the presence of first name' do
      should validate_presence_of(:first_name)
    end
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:role) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('not_an_email').for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('onlyletters').for(:first_name) }
    it { should_not allow_value('letters123').for(:first_name) }
    it { should allow_value('onlyletters').for(:last_name) }
    it { should_not allow_value('letters123').for(:last_name) }
    it { should allow_value('12345678901').for(:phone) }
    it { should_not allow_value('123456789012').for(:phone) }
    it { should_not allow_value('').for(:first_name) }
    it { should_not allow_value('').for(:last_name) }
    it { should_not allow_value('').for(:phone) }
    it { should_not allow_value('').for(:role) }
  end
end
