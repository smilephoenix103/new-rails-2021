Rails.application.routes.draw do

  
  devise_for :users
  # get 'note_collection/index'
  # get 'note_for_sell/index'
  # get 'note_for_sell/show'
  # get 'note_collection/show'
  get 'note_collection/show_currency/:id', to: 'note_collection#show_currency', as: 'show_currency'
  get 'note_collection/show_note/:id', to: 'note_collection#show_note', as: 'show_note'

  
  resources :reports
  # get 'home/index'
  root 'home#index'
  get 'home/about'

  get 'currencies/new/country/currency'

  resources :countries

  resources :currencies
  resources :notes
  resources :note_for_sell
  resources :note_collection

  resources :coins
  get 'coins/coin_currencies/:id', to: 'coins#coin_currencies', as: 'coin_currencies'
  get 'coins/coin_show_currency/:id', to: 'coins#coin_show_currency', as: 'coin_show_currency'
  get 'coins/new/:id', to: 'coins#new', as: 'new'

  resources :countries do
    resources :currencies
  end

  resources :currencies do
    resources :notes
  end  

  resources :currencies do
    resources :coins
  end  
  
  # resources :currencies do
  #   resources :notes
  # end

  mount ReportsKit::Engine, at: '/'

  # APi controller
  
  namespace :api do 
    resources :country, only: [:index, :show]
    
 end
end
