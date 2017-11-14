Rails.application.routes.draw do
  resources :events
  resources :locations, only: [:new, :create]
  resources :users, except: [:index]
  resources :rsvps

  # Landing Page
  get "/", to: "static#home", as: "root"

  # User Authentication routes
  post "/login", to: "sessions#create"
  post "/sessions/:id", to: "sessions#destroy", as: "logout"

  post '/search', to: "locations#search", as: 'search'
  get '/search', to: 'events#index'
end
