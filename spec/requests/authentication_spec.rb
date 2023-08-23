require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticates the user' do
      post '/api/v1/authenticate', params: { username: "Test Franci", password: "test password" }

      expect(response).to have_http_status(:created)
      expect(response.body['token']).to eq('tokencode123')
    end

    it 'returns error when username is missing' do
      post '/api/v1/authenticate', params: { password: "test password" }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { username: "Test Franci" }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
