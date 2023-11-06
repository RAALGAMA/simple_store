Rails.application.routes.draw do
  resources :customers
  # get "products/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index]
  get "/products", to: "products#index"
  get "/products/:id", to: "products#show", as: "product"
  get 'customers/alphabetized', to: 'customers#alphabetized'
end
