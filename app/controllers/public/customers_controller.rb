class Public::CustomersController < ApplicationController
#会員ログインの制限
before_action :authenticate_customer!


#顧客のマイページ
  def show
    @customer = Customer.find(params[:id])
  end

#顧客の登録情報編集画面
  def edit
    @customer = Customer.find(params[:id])
  end

#顧客の登録情報更新
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

#顧客の退会確認画面
  def unsubscribe
    @customer = Customer.find_by(id: current_customer)
  end

#顧客の退会処理(ステータスの更新)
  def withdraw
    @customer = Customer.find_by(id: current_customer)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :postal_code, :telephone_number)
  end

end
