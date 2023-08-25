require 'rails-helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /api/v1/users' do
    subject { get '/api/v1/users' }

    context 'when there are users' do
      before do
        create_list(:user, 3)

        subject
      end

      it 'should return all users' do
        expect(response).to have_http_status(:success)
        expect(json['users'].size).to eq(5)
        expect(json['users'].to all(include('id', 'name', 'email', 'role')))
      end
    end

    context 
  end
end
