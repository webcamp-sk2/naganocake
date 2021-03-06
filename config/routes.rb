Rails.application.routes.draw do

  #homes
  root 'homes#top'
  get 'homes/about' => "homes#about"

  #devise
  devise_for :publics
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :public do
    #住所
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    #カート内商品
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get "cart_items/destroy_all" => "cart_items#destroy_all", as: :destroy_all

    #顧客
    resource :customer, only: [:show, :edit, :update]
    get "customers/unsubscribe" => "customers#unsubscribe", as: :unsubscribe
    delete "customers/withdraw" => "customers#withdraw", as: :withdraw

    #商品
    resources :items, only: [:index, :show]

    #注文
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/comfirm" => "orders#comfirm", as: :comfirm
    get "orders/complete" => "orders#complete", as: :complete

  end

  namespace :admin do
    #顧客情報
    resources :customers, only: [:index, :show, :edit, :destroy, :update]

    #ジャンル
    resources :genres, only: [:index, :create, :edit, :update]

    #商品
    resources :items

    #注文詳細
    resources :order_details, only: [:update]

    #注文
    resources :orders, only: [:index, :show, :update]
  end
end
