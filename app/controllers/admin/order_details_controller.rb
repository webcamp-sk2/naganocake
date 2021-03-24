class Admin::OrederDetailsController < ApplicationController

    before_action :authenticate_admin!

    def update
        @oreder_detail = OrederDetail.find(params[:id])
        @order = @oreder_detail
        @oreder_detail.update(oreder_detail_params)

        #
        if @oreder_detail.making_status == 2 #製作ステータスが（制作中）であれば
            @order.update(order_status: 2) #注文ステータスも（制作中）になる
        end
    end

    private

         def oreder_detail_params
            params.require(:order_detail).permit(:making_status)
         end
 end

