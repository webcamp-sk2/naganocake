class Public::ItemsController < ApplicationController
  
  def index
   #販売ステータスにて（販売中）のもののみ表示
   @items = Item.where(is_active: 0).page(params[:page]).per(8)
   #商品の個数カウント
   @quantity = Item.count　
  end
  
  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
