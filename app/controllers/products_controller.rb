class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @product = Product.new params.require(:product).permit(:name, :description, :price)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update params.require(:product).permit(:name, :description, :price)
      redirect_to product_path(@product)
    else
      render :edit
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new

  end

  def edit
    @product = Product.find(params[:id])
    
  end

  
  
end
