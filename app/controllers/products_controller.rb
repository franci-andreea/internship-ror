class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def edit
    puts "params[:id] = #{params[:id]}"
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product with #{params[:id]} successfully deleted!"
    redirect_to products_path
  end
end
