class Public::CartItemsController < ApplicationController
before_action :authenticate_public!

  def index
    @cart_items = CartItem.where(public_id: current_public.id)
    @public = Public.find(current_public.id)
  end

  def create
    @item = Item.find(params[:item_id])
    @cart_item = current_customer.cart_items.new(item_id: @item.id)
    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to public_cart_items_path
  end

  def destroy
    @item = Item.find(params[:item_id])
    @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

end
