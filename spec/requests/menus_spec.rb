# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  let!(:menu) { FactoryBot.create(:menu, :lunch) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/menus'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/menus/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/menus/#{menu.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/menus/#{menu.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      expect do
        delete "/menus/#{menu.id}"
      end.to change(Menu, :count).by(-1)
    end
  end
end
