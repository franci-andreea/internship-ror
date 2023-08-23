class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all

    render json: ProductSerializer.new(products).serialize
  end

  def new
    @categories = Product.categories.keys
    @product = Product.new
  end

  def create
    product = Product.create!(product_params)
      
    render json: ProductSerializer.new(product).serialize, status: :created
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Product.categories.keys
  end

  def update
    product = Product.find(params[:id])
    product.update!(product_params)
    
    render json: ProductSerializer.new(product).serialize, status: :success
  end

  def destroy
    product = Product.find(params[:id])
  end

  private
    def product_params
      params.permit(:name, :price, :vegetarian, :category, :description)
    end
end
