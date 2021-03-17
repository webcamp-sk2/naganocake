Rails.application.routes.draw do
 
  #homes
  root 'homes#top'
  get 'homes/about' => "homes#about"
 
  #devise
  devise_for :publics
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end
