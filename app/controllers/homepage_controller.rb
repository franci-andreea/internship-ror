class HomepageController < ApplicationController

  def index
    @products = Product.all

    @products = @products.where(category: :entree) if params[:category] == 'entree'
    @products = @products.where(category: :second_course) if params[:category] == 'second-course'
    @products = @products.where(category: :dessert) if params[:category] == 'dessert'

    @products = @products.order(:name) if params[:order] == 'az'
    @products = @products.order(name: :desc) if params[:order] == 'za'
    @products = @products.order(:price) if params[:order] == 'ascending'
    @products = @products.order(price: :desc) if params[:order] == 'descending'

    @products = @products.where(vegetarian: true) if params[:vegetarian] == 'vegetarian'
    @products = @products.where(vegetarian: false) if params[:vegetarian] == 'non-vegetarian'
  end

end
