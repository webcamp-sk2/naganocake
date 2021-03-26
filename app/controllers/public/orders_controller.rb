class Public::OrdersController < ApplicationController
before_action :authenticate_public!

   #注文履歴一覧
   def index
     @orders = current_public.orders
   end

   #注文履歴の詳細
   def show
     @order = Order.find(params[:id])
     @oreder_details = @order.oreder_details
   end

   #注文情報の入力画面
   def new
     @cart_items = CartItem.where(public_id: current_public.id)
     @order = Order.new
   end


   #注文確認画面
   def comfirm
     @order = Order.new(order_params)
     @cart_items = CartItem.where(public_id: current_public.id)
     @public = current_public



    case params[:address]

    #登録時の住所
    when "public_address"
      @order.postal_code = @public.postal_code
      @order.address = @public.address
      @order.name = @public.last_name + @public.first_name

    #配送先の住所
    when "existing_address"
      order_address = Address.find(params[:order][:id])
      @order.postal_code = order_address.postal_code
      @order.address = order_address.address
      @order.name = order_address.name

    #新しく住所を登録
    when "address"
      @address = Address.new(address_params)
      @address.public_id = @public.id
      if  @address.save
        @order.postal_code = @add_address.postal_code
        @order.address = @add_address.address
        @order.name = @add_address.name
      else
        redirect_back(fallback_location: root_path)
      end


    end

   end

    #注文の確定処理
    def create
    @order = Order.new(order_params)
    @order.public_id = current_public.id
    @order.shipping_cost = 800
    @order.status = 0
    pay_amount = Order.total_amount_calculator(current_public.cart_items)
    @order.total_payment = pay_amount + @order.shipping_cost.to_i
    @order.save

    # カート商品　保存
    current_public.cart_items.each do |cart_item|
      oreder_detail = @order.oreder_details.build
      oreder_detail.order_id = @order.id
      oreder_detail.item_id = cart_item.item_id
      oreder_detail.amount = cart_item.amount
      oreder_detail.price = cart_item.item.price
      oreder_detail.save
      cart_item.destroy
    end
      render :complete

    #新しい住所登録を行なった場合配送先テーブルに保存
    #if Address.find_by(address: @address).nil?
      #@address = Address.new
      #@address.name = @order.name
      #@address.address = @order.address
      #@address.postal_code = @order.postal_code
     # @address.public_id = current_public.id
     # @address.save
    #end
    end


    #注文完了の画面
    def complete
    end



  private

  def order_params

    params.require(:order).permit(
      :public_id,
      :address,
      :total_payment,
      :payment_method,
      :name,
      :postal_code,
      :shipping_cost,
      :status,
      :created_at,
      :updated_at
    )
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end