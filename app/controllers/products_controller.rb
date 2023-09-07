class ProductsController < ApplicationController
  def index
    if current_user.admin?
      @products = Product.all
    else 
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
      @categories = Product.categories.keys
      @product = Product.new
    else 
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Successfully created the product #{@product.name}!"
      
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    if current_user.admin?
      @product = Product.find(params[:id])
      @categories = Product.categories.keys
    else
      redirect_to root_path
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:success] = "Product updated successfully!"

      redirect_to edit_product_path
    else
      flash[:danger] = "Update failed. Try again!"

      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product with #{params[:id]} successfully deleted!"

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :vegetarian, :description, :image, :category)
    end
end
