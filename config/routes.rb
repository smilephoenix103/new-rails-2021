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
