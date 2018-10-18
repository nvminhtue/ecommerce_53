Rails.application.routes.draw do
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
  post "/product_rating/:id", to: "products#rating", as: "rating"
  get "/suggestions", to: "suggestions#new"
  post "/suggestions", to: "suggestions#create"
  get "/recently", to: "recent_views#recently"
  get "/cart", to: "carts#show"
  get "/checkout", to: "carts#destroy"
  get "/history", to: "orders#index"

  resources :users
  resources :products
  resources :categories
  resources :orders
  resources :detail_orders, only: [:create, :update, :destroy]

  namespace :admin do
    root "static_pages#home"
    resources :users
    get "/import", to: "products#show"
    resources :products do
      collection {post :import}
    end
    resources :categories
    resources :suggestions
    resources :orders, only: %i(index update destroy)
    resources :detail_orders, only: :show
  end
end
