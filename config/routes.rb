Rails.application.routes.draw do
  resources :countries
  # get 'home/index'
  root 'home#index'
  get 'home/about'
end
