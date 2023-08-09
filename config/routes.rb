Rails.application.routes.draw do
  get 'sessions/new'

  get 'homepage', to:"homepage#index", as: 'filtered_products'
  get 'homepage/sort/:order', to:"homepage#index", as: 'sorted_products'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  # Defines the root path route ("/")
  root "homepage#index"
end
