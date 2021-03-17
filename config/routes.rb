 Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  #homes
  root 'homes#top'
  get 'homes/about' => "homes#about"
 
  #devise
  devise_for :publics
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end
