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
    resources :addresses
  
    #カート内商品
    resources :cart_items
  
    #顧客
    resource :customer
  
    #商品
    resources :items
    
    #注文
    resources :orders
    
    #会員登録
    resources :registrations
    
    #ログイン
    resources :sessions
  end
end
