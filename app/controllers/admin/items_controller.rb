class Admin::ItemsController < ApplicationController

  # before_action :authenticate_admin!

  #商品一覧
  def index
    @items = Item.all
    @items = Item.page(params[:id]).per(10)
  end

 #商品詳細
  def show
    @item = Item.find(params[:id])
  end

  #商品編集
  def edit
    @item = Item.find(params[:id])
  end

  #商品新規作成
  def new
    @item = Item.new
  end

  #商品更新
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render 'edit'
    end
  end

  #商品削除
  def destroy
    @item = Item.find(params[:id])
    @item = Item.destroy
    redirect_to admin_items_path
  end

  #商品新規登録
  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
