class Admin::OrderDetailsController < ApplicationController
    
    before_action :authenticate_admin!
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail
        @order_detail.update(order_detail_params)
        
        #
        if @order_detail.making_status == 2 #製作ステータスが（制作中）であれば
            @order.update(order_status: 2) #注文ステータスも（制作中）になる
        end
    end 
    
    private
        
         def order_detail_params
            params.require(:order_detail).permit(:making_status)
         end
 end 
 
