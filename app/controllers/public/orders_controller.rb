class Public::OrdersController < ApplicationController

  def new
   @cart_item = Cart_item.find(params[:cart_item_id])
   @order = @item.order.new(order_params)
  end

  def comfirm
    @cart_item = Cart_item.find(params[:cart_item_id])
    @order = Order.new(order_params)
  end

  def complete
  end

  def create
    @cart_item = Cart_item.find(params[:cart_item_id])
    @order = Order.new(order_params)
    @order.save
    redirect to public_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @orders = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :addresses, :name, :cart_item_id)
  end

end
