class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @signup = true
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      login @user
      flash[:success] = "Welcome to Food Ordering App!"
      
      redirect_to @user
    else
      render 'new'
    end
  end

  def show_cart
    @user = User.find(params[:id])
    @cart = Order.find_by("user_id = ? AND is_cart = ?", @user.id, true)
    if !@cart.nil?
      @products = get_users_products(@cart)
      @total = compute_cart_total(@cart)
      @quantities = compute_quantities(@cart)
    end
  end

  def remove_from_cart
    @cart = Order.find(params[:cart_id])
    product_id = params[:product_id].to_i
    @quantities = update_quantities(@cart, product_id)
    @order_product = @cart.order_products.find_by("product_id = ?", product_id)

    if @quantities[product_id] == 0
      @cart.order_products.destroy(@order_product)
    else
      @order_product.update(quantity: @quantities[product_id])
    end

    redirect_to show_cart_path
  end

  def show_orders
    @orders = Order.where("user_id = ?", params[:id])
    
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
