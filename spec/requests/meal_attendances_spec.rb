# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MealAttendances', type: :request do
  let!(:meal_attendance) { FactoryBot.create(:meal_attendance, :lunch) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/meal_attendances'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/meal_attendances/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      expect do
        delete "/meal_attendances/#{meal_attendance.id}"
      end.to change(MealAttendance, :count).by(-1)
    end
  end
end
