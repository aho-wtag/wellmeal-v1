require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user){FactoryBot.create(:user, :user)}
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
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/users/#{user.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /user' do
    let!(:valid_params) do
      {
        user: {
          first_name: 'Arman',
          last_name: 'Hossain',
          email: 'ar@mail.com',
          phone: '+8801965555555',
        role: 'user'
        }
      }
    end
    let!(:invalid_params) do
      {
        user: {
          first_name: 'Arman',
          last_name: 'Hossain',
          email: 'wrongemail.com',
          phone: '01965555555'
        }
      }
    end

    it 'should render the new user form' do
      get '/users/new'
      expect(response).to render_template(:new)
    end

    context 'when the request is valid' do
      it 'creates a new user' do
        expect do
          post '/users', params: valid_params
        end.to change(User, :count).by(1)
      end
    end

    context 'when the request is invalid' do
      it 'does not create a new user' do
        expect do
          post '/users', params: invalid_params
        end.to_not change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /users' do
    let(:valid_params) { { user: { first_name: 'NewFirstName' } } }

    it 'should render the edit users form' do
      get "/users/#{user.id}/edit"
      expect(response).to render_template(:edit)
    end

    it 'updates the users' do
      patch "/users/#{user.id}", params: valid_params
      user.reload
      expect(user.first_name).to eq('NewFirstName')
    end

    it 'returns a success response' do
      put "/users/#{user.id}", params: valid_params
      expect(response).to have_http_status(:see_other)
    end
  end
  end


