class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  #会員一覧
  def index
    @publics = Public.page(params[:page]).per(10)
  end

  #会員詳細
  def show
     @public = Public.find(params[:id])
  end

  #会員情報編集
  def edit
     @public = Public.find(params[:id])
  end

  #会員大会？←後ほど編集予定
  def destroy
     @public = Public.find(params[:id])
     @public.destroy
  end

  #会員除法更新
  def update
     @public = Public.find(params[:id])
     if @public.update(public_params)
       redirect_to admin_customer_path
     else
       render "edit"
     end
  end

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :postal_code, :telephone_number, :is_deleted)
  end


end
