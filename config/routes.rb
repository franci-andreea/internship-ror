Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'homepage', to:"homepage#index", as: 'filtered_products'

  get 'homepage/sort/:order', to:"homepage#index", as: 'sorted_products'

  # Defines the root path route ("/")
  root "homepage#index"
end
