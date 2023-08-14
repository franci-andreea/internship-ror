class HomepageController < ApplicationController
  def index
    @homepage = true
    
    @products = Product.all

    @products = @products.where("category = ?", Product.categories[params[:category]]) if params[:category].present? && params[:category] != 'none'
    if params[:sorting].present? && params[:sorting] != 'none'
      if params[:sorting] == 'az'
        @products = @products.order(:name)
      elsif params[:sorting] == 'za'
        @products = @products.order(name: :desc)
      elsif params[:sorting] == 'ascending-price'
        @products = @products.order(:price)
      elsif params[:sorting] == 'descending-price'
        @products = @products.order(price: :desc)
      end
    end
    @products = @products.where(vegetarian: params[:vegetarian] == 'vegetarian') if params[:vegetarian].present? && params[:vegetarian] != 'none'
 
    @products = @products.where("price >= ? AND price <= ?", params[:min_price].to_i, params[:max_price].to_i) if params[:min_price].present? && params[:max_price].present?
  end
end
