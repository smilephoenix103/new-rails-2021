Rails.application.routes.draw do

  
  # get 'note_collection/index'
  # get 'note_for_sell/index'
  # get 'note_for_sell/show'
  # get 'note_collection/show'
  
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

  resources :countries do
    resources :currencies
  end

  resources :currencies do
    resources :notes
  end  
  
  # resources :currencies do
  #   resources :notes
  # end

  mount ReportsKit::Engine, at: '/'
  
end
