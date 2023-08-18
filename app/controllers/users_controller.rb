class UsersController < ApplicationController
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
  end

  def add_to_cart
    @user = User.find(params[:id])
    @product = Product.find(params[:product_id])

    

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
