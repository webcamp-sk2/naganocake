class Admin::OrderDetailsController < ApplicationController

    before_action :authenticate_admin!

  def update

    @oreder_detail = OrederDetail.find(params[:id])
    @oreder_details = @oreder_detail.order.oreder_details
    making_status = OrederDetail.making_statuses[oreder_detail_params[:making_status]]

    if @oreder_detail.update(oreder_detail_params)

      if making_status >=  OrederDetail.making_statuses["製作中"]
        @oreder_detail.order.update(status: 2)
      else
        @oreder_detail.order.update(status: 1)
      end

      if @oreder_details.pluck(:making_status).reject { |n| n == OrederDetail.making_statuses.keys[-1] }.blank?
        @oreder_detail.order.update(status: 3)
      end
      redirect_to admin_order_path(@oreder_detail.order)
    else
      render "show"
    end
  end

    private

         def oreder_detail_params
            params.require(:oreder_detail).permit(:making_status)
         end
 end

