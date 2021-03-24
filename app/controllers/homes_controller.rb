class HomesController < ApplicationController
  def top
    @items = Item.all  #reverse_order(params[:page]).per(4) 引数エラーになります
    @items = Item.page(params[:page]).per(4)
  end

  def about
  end
end