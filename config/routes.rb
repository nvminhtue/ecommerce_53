Rails.application.routes.draw do
  get 'orders/index'
  root "static_pages#home"

  get "/cart", to: "carts#show"
  get "/checkout", to: "carts#destroy"
  get "/history", to: "orders#index"
  get "sessions/new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/upload", to: "products#new"
  post "/upload", to: "products#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :products
  resources :orders
  resources :detail_orders, only: [:create, :update, :destroy]
  resources :users
end
