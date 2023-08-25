require_relative '../../../rails_helper'

RSpec.describe 'Users', type: :request do
  # authenticate a user
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:header) { {'Authorization' => "Bearer #{token}"} }

  let(:user_params) do
    {
      name: "Franci Admin",
      email: "franci.test3@admin.com",
      password: "admin123",
      password_confirmation: "admin123"
    }
  end

  describe 'POST /api/v1/users' do
    context 'when all fields are valid' do
      it 'should create a user' do
        expect { post "/api/v1/users", params: user_params }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('id', 'name', 'role')
      end
    end
  end
end
