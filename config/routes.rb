Rails.application.routes.draw do
  get 'sessions/new'

  get '/homepage', to: "homepage#index"
  get '/filter', to: "homepage#index"

  get '/admin', to: "admin#index"

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :orders
  resources :products
  resources :users
  get '/users/:id/my-cart', to: 'users#show_cart', as: 'show_cart'
  post '/users/:id/add-to-cart/:product_id', to: 'users#add_to_cart', as: 'add_to_cart'

  # Defines the root path route ("/")
  root "homepage#index"
end
