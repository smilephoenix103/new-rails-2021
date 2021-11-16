Rails.application.routes.draw do
  resources :settings
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  
    resources :signatures
    get 'coin_new/index'
    get 'note_new/index'
    resources :boughts
    resources :patterns
    resources :bonds
    devise_for :users
    # get 'note_collection/index'
    # get 'note_for_sell/index'
    # get 'note_for_sell/show'
    # get 'note_collection/show'
    get 'note_collection/show_currency/:id', to: 'note_collection#show_currency', as: 'show_currency'
    get 'note_collection/show_note/:id', to: 'note_collection#show_note', as: 'show_note'
    get 'note_collection/show_note_user/:id', to: 'note_collection#show_note_user', as: 'show_note_user'
    get 'note_collection/back_show_currency/:id', to: 'note_collection#back_show_currency', as: 'back_show_currency'
    get 'note_collection/show_all_notes/:id', to: 'note_collection#show_all_notes', as: 'show_all_notes'

    get 'note_collection/back_to_country_note_collection/:continent', to: 'note_collection#back_to_country_note_collection', as: 'back_to_country_note_collection'


    
    
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
    resources :note_sold, only: [:index, :show]
    resources :note_new, only: [:index, :show]
    resources :coin_new, only: [:index, :show]
    resources :note_collection, only: [:index, :show]
    resources :coin_for_sell, only: [:index, :show]
    resources :note_future, only: [:index, :show]
    resources :coin_collection, only: [:index, :show]
    resources :bond_collection, only: [:index, :show]
    get 'coin_collection/show_coins/:id', to: 'coin_collection#show_coins', as: 'show_coins'
    get 'coin_collection/show_details_coin/:id', to:'coin_collection#show_details_coin', as: 'show_details_coin'
    get 'coin_collection/show_coin_user/:id', to: 'coin_collection#show_coin_user', as: 'show_coin_user'
    get 'coin_collection/back_show_currency_coin/:id', to: 'coin_collection#back_show_currency_coin', as: 'back_show_currency_coin'
    

    resources :notes
    get 'notes/note_currencies/:id', to: 'notes#note_currencies', as: 'note_currencies'
    get 'notes/note_show_currency/:id', to: 'notes#note_show_currency', as: 'note_show_currency'
    get 'note_search', to: 'notes#note_search'

    resources :coins
    get 'coins/coin_currencies/:id', to: 'coins#coin_currencies', as: 'coin_currencies'
    get 'coins/coin_show_currency/:id', to: 'coins#coin_show_currency', as: 'coin_show_currency'
    get 'coins/new/:id', to: 'coins#new', as: 'new'
    get 'coin_search', to: 'coins#coin_search'

    # BONDS
  
    get 'bonds/bond_currencies/:id', to: 'bonds#bond_currencies', as: 'bond_currencies'
    get 'bonds/bond_show_currency/:id', to: 'bonds#bond_show_currency', as: 'bond_show_currency'
    get 'bond_search', to: 'bonds#bond_search'

    get 'bond_collection/show_bonds/:id', to: 'bond_collection#show_bonds', as: 'show_bonds'
    get 'bond_collection/back_show_currency_bond/:id', to: 'bond_collection#back_show_currency_bond', as: 'back_show_currency_bond'
    get 'bond_collection/show_bond_user/:id', to: 'bond_collection#show_bond_user', as: 'show_bond_user'


    # get 'bond_collection/show_details_bond/:id', to:'bond_collection#show_details_bond', as: 'show_details_bond'  

    # Note for sell
    get 'note_for_sell_list', to: 'note_for_sell#note_for_sell_list'

    # Note Future
    get 'note_future_list', to: 'note_future#note_future_list'
    get 'note_future/show_note_future/:id', to: 'note_future#show_note_future', as: 'show_note_future'


    resources :countries do
      resources :currencies
    end 

    get 'country_search', to: 'countries#country_search'

    resources :currencies do
      resources :notes
    end  

    resources :currencies do
      resources :coins
    end  
    
    resources :currencies do
      resources :bonds
    end  

    mount ReportsKit::Engine, at: '/'

  end  
    # APi controller
  
    namespace :api do 
      namespace :v1 do
        resources :country, only: [:index, :show]  
        resources :currencies
      end    
    end

end
