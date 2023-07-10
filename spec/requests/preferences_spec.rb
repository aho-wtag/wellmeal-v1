# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Preferences', type: :request do
  let!(:preference) { FactoryBot.create(:preference) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/preferences'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/preferences/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/preferences/#{preference.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/preferences/#{preference.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      expect do
        delete "/preferences/#{preference.id}"
      end.to change(Preference, :count).by(-1)
    end
  end
end
