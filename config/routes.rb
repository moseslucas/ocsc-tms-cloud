Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  root 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :syncs
    end
  end

  resources :discounts
  resources :clients

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/switch', to: 'sessions#switch'

  resources :deliveries
  resources :cargos
  resources :payments

  get 'daily_report', to: 'payments#daily_report'
  get 'cargo_transaction', to: 'payments#cargo_transaction_report'
  get 'cargo_collect', to: 'payments#cargo_collect_report'
  get 'soa', to: 'payments#soa'
  get 'soa_print', to: 'payments#soa_print'
  get '/add_payment/:id', to: 'payments#add'

  get 'collections', to: 'collections#index'

end
