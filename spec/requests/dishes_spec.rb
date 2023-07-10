# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dishes', type: :request do
  let!(:dish) { FactoryBot.create(:dish) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/dishes'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/dishes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/dishes/#{dish.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/dishes/#{dish.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      expect do
        delete "/dishes/#{dish.id}"
      end.to change(Dish, :count).by(-1)
    end
  end
end
