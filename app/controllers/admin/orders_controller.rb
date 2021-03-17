class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

#注文履歴一覧（１０ページ分の表示）
　def index
　    @oders = Order.all.page(params[:id]).per(10)
　end

#注文履歴詳細
　def show
　    @oder = Order.find(params[:id])
　    @order_details = @order.order_details
　end

#ステータス更新
　def update
　    @oder = Order.find(params[:id])
　    @oder.update(order_params)
　    redirect_to admin_oder_path
　end

   private
   def order_params
      params.require(:oder).permit(:status)
   end

end
