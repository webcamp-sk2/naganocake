class Public::CustomersController < ApplicationController
#会員ログインの制限
before_action :authenticate_public!


#顧客のマイページ
  def show
  end

#顧客の登録情報編集画面
  def edit
  end

#顧客の登録情報更新
  def update
    current_public.update(public_params)
    redirect_to public_customer_path(current_public)
  end

#顧客の退会確認画面
  def unsubscribe
  end

#顧客の退会処理(ステータスの更新)
  def withdraw
    current_public.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end


private

  def public_params
    params.require(:public).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :postal_code, :telephone_number)
  end

end
