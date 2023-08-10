# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notices', type: :request do
  let!(:notice) { FactoryBot.create(:notice) }
  let!(:user) { FactoryBot.create(:user, :admin) }
  before(:each) do
    sign_in(user)
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/notices'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/notices/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/notices/#{notice.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/notices/#{notice.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      expect do
        delete "/notices/#{notice.id}"
      end.to change(Notice, :count).by(-1)
    end
  end
end
