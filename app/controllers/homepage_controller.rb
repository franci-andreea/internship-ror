class HomepageController < ApplicationController

  def index
    @products = Product.all

    @products = @products.where(category: params[:category])

    @products = @products.order(:name) if params[:order] == 'az'
    @products = @products.order(name: :desc) if params[:order] == 'za'
    @products = @products.order(:price) if params[:order] == 'ascending'
    @products = @products.order(price: :desc) if params[:order] == 'descending'

    @products = @products.where(vegetarian: params[:vegetarian] == 'vegetarian')
  end
end
