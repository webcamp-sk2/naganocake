Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  devise_for :agmins
  devise_for :publics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
