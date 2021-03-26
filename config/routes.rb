Rails.application.routes.draw do

  
  resources :bonds
  devise_for :users
  # get 'note_collection/index'
  # get 'note_for_sell/index'
  # get 'note_for_sell/show'
  # get 'note_collection/show'
  get 'note_collection/show_currency/:id', to: 'note_collection#show_currency', as: 'show_currency'
  get 'note_collection/show_note/:id', to: 'note_collection#show_note', as: 'show_note'

  
  
  # get 'home/index'
  root 'home#index'
  get 'home/about'
  get 'reports/chart'

  get 'currencies/new/country/currency'

  resources :reports
  resources :countries
  resources :currencies
  resources :notes
  resources :note_for_sell, only: [:index, :show]
  resources :note_collection, only: [:index, :show]
  resources :coin_for_sell, only: [:index, :show]
  resources :coin_collection, only: [:index, :show]
  resources :bond_collection, only: [:index, :show]
  get 'coin_collection/show_coins/:id', to: 'coin_collection#show_coins', as: 'show_coins'
  get 'coin_collection/show_details_coin/:id', to:'coin_collection#show_details_coin', as: 'show_details_coin'

  resources :coins
  get 'coins/coin_currencies/:id', to: 'coins#coin_currencies', as: 'coin_currencies'
  get 'coins/coin_show_currency/:id', to: 'coins#coin_show_currency', as: 'coin_show_currency'
  get 'coins/new/:id', to: 'coins#new', as: 'new'

  # BONDS
 
  get 'bonds/bond_currencies/:id', to: 'bonds#bond_currencies', as: 'bond_currencies'
  get 'bonds/bond_show_currency/:id', to: 'bonds#bond_show_currency', as: 'bond_show_currency'

  get 'bond_collection/show_bonds/:id', to: 'bond_collection#show_bonds', as: 'show_bonds'
  # get 'bond_collection/show_details_bond/:id', to:'bond_collection#show_details_bond', as: 'show_details_bond'  


  resources :countries do
    resources :currencies
  end

  resources :currencies do
    resources :notes
  end  

  resources :currencies do
    resources :coins
  end  
  
  resources :currencies do
    resources :bonds
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
