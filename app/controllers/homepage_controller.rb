class HomepageController < ApplicationController

  def index
    @homepage = true
    
    @products = Product.all

    @products = @products.where(category: params[:category]) if params[:category].present?

    @products = @products.order(:name) if params[:order] == 'az' if params[:order].present?
    @products = @products.order(name: :desc) if params[:order] == 'za' if params[:order].present?
    @products = @products.order(:price) if params[:order] == 'ascending' if params[:order].present?
    @products = @products.order(price: :desc) if params[:order] == 'descending' if params[:order].present?

    @products = @products.where(vegetarian: params[:vegetarian] == 'vegetarian') if params[:vegetarian].present?

    # @products = @products.where(price: params[:min_price]..params[:max_price]) if params[:min_price].present? && params[:max_price].present?
  end
end
