class HomesController < ApplicationController
  def top
    @items = Item.all  #reverse_order(params[:page]).per(4) 引数エラーになります
  end

  def about
  end
end