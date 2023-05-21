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
    @order = Order.new permit
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update
    if @order.update permit
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
  def permit
    params.require(:order).permit(:firstname, :lastname, :address, :phone)
  end

  def find()
    @order = Order.find(params[:id])
  end
end
