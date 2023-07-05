require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:user){FactoryBot.create(:user, :user)}
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end
  #
  # describe 'GET /edit' do
  #   it 'returns http success' do
  #     get '/users/edit'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get '/users/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe 'GET /destroy' do
  #   it 'returns http success' do
  #     get '/users/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
