class ProductsController < ApplicationController
before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end
  
  def show
     
  end

  def new
    @product = Product.new
  end

  def edit
  end
  
  def create
    @product = Product.new permit
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
    if @product.update permit
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end
  
  private
  def permit
    params.require(:product).permit(:name, :description, :price, :balance)
  end

  def find()
    @product = Product.find(params[:id])
  end
  
end
