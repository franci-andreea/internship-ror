require_relative '../../../rails_helper'

RSpec.describe 'Products', type: :request do
  # authenticate a user
  let(:admin) { create(:user, :is_admin) }
  let(:token) { JsonWebToken.encode(user_id: admin.id) }
  let(:headers) { {'Authorization' => "Bearer #{token}"} }

  let(:product_params) do
    {
      name: "Product Name Test", 
      price: 12.24, 
      vegetarian: false, 
      category: "dessert", 
      description: "description pentru test products"
    }
  end

  describe 'POST /api/v1/products' do
    context 'when all fields are valid' do
      before do
        token
      end

      it 'should create a product' do
        expect { post "/api/v1/products", params: product_params, headers: headers }.to change(Product, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('id', 'name', 'price', 'vegetarian', 'category', 'description')
      end
    end
  end

  describe 'GET /api/v1/products' do
    subject { get '/api/v1/products', headers: headers }

    context 'when there are products' do
      before do
        create_list(:product, 5)
        token

        subject
      end

      it 'should return all products' do
        puts JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(5)
        expect(JSON.parse(response.body)).to all(include('id', 'name', 'price', 'vegetarian', 'category', 'description'))
      end
    end

  end
end
