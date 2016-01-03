Rails.application.routes.draw do
  root to: "catalogs#index"


  get "/signup", to: 'users#new', as: 'signup'
  get "/signin", to: 'sessions#new', as: 'signin'

  post "/signin", to: 'sessions#create'

  resources :authors
  resources :publishers
  resources :books
  resources :users, only: [:index, :show, :new, :create]
end
