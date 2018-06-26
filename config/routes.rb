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
  resources :payments do
    collection do
      post :create_multiple
    end
  end

  get 'daily_report', to: 'payments#daily_report'
  get 'cargo_transaction', to: 'payments#cargo_transaction_report'
  get 'cargo_collect', to: 'payments#cargo_collect_report'
  get 'soa', to: 'payments#soa'
  get 'soa_print', to: 'payments#soa_print'
  get '/add_payment/:id', to: 'payments#add'

  get 'collections', to: 'collections#index'
  get 'collection_by_clients', to: 'collection_by_clients#index'
  get '/collection_by/:id', to: 'collection_by_clients#cargos'

  get '/master_deliveries', to: 'deliveries#master_index'

end
