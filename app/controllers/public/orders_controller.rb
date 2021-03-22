class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(public_id: current_public.id)
  end

  def show
    unless params[:id] == "confirm"
      @order = Order.find(params[:id])
      @order_products = @order.order_products
      order_total(@order_products)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @cart_products = CartProduct.where(public_id: current_public.id)
    @order = Order.new
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :order_status, :total_price, :postcode, :address, :address_name, :payment_selection, :postage)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :address_name)
  end
end