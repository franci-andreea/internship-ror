class OrdersController < ApplicationController
  include OrdersHelper

  def add_to_cart
    @user = User.find(params[:id])
    @product = Product.find(params[:product_id])

    # check if a cart with this user id already exists
    if get_cart(@user).nil?
      # there is no cart, create a new one
      @cart = create_cart(@user)
      if @cart.save
        redirect_to root_path
      end
    else
      # if it does, then add the product to that one
      @cart = get_cart(@user)
    end
    add_product_to_cart(@cart, @product, params[:quantity])
    @cartNotify = true
  end

  def new
  end

  def create
  end

  def update
  end
end
