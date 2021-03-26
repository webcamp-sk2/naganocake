class Admin::OrdersController < ApplicationController

 before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @oreder_details = @order.oreder_details
  end

  def update

    @order = Order.find(params[:id])
    status = Order.statuses[order_params[:status]]

    if @order.update(order_params)

      if status >= Order.statuses["入金確認"]
        @order.oreder_details.each do |oreder_detail|
          oreder_detail.update(making_status: 1)
        end
      else
        @order.oreder_details.each do |oreder_detail|
          oreder_detail.update(making_status: 0)
        end
      end

      redirect_to admin_order_path(@order)
    else
      @oreder_details = @order.oreder_details
      render "show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end