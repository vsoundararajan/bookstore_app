Rails.application.routes.draw do
  root to: "catalogs#index"

  namespace :admin do
    get 'base/index'
    get '/add_publisher', to: 'publishers#new', as: 'add_publisher'

    resources :authors
    resources :publishers, except: [:new]
    resources :books
  end

  get "/signup", to: 'users#new', as: 'signup'
  get "/signin", to: 'sessions#new', as: 'signin'
  get "/signout", to: 'sessions#destroy', as: 'signout'

  post "/signin", to: 'sessions#create'

  
  
  resources :books, only: [:show]
  resources :users, only: [:index, :show, :new, :create]
  resource :session
  resources :catalogs, only: [:index, :show] do
      collection do
        post :search, to: 'catalogs#search'
      end
  end

  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new]
end
