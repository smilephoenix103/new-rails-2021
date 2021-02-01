Rails.application.routes.draw do

  
  # get 'home/index'
  root 'home#index'
  get 'home/about'

   resources :countries do
    resources :currencies
  end
  
  resources :currencies do
    resources :notes
  end

  resources :countries
  resources :currencies
  resources :notes
  
end
