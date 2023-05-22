class OrdersController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
  end
  
  def show     
  end

  def new
    @order = Order.new
  end

  def edit
  end
  
  def create
    @order = Order.new get_permition
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update
    if @order.update get_permition
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end
  
  private
  def get_permition
    params.require(:order).permit(:firstname, :lastname, :address, :phone)
  end

  def find()
    @order = Order.find(params[:id])
  end
end
