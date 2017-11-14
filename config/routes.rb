Rails.application.routes.draw do
  resources :events, except: [:new]
  resources :locations, only: [:new, :create]
  resources :users
  resources :rsvps, only: [:create]
  resources :friendships, only: [:create]

  # Landing Page
  get '/', to: "static#home", as: 'root'

  # Dashboard Page
  get '/user/dashboard', to: 'users#dashboard'

  # User Authentication routes
  post '/login', to: 'sessions#create'
  post '/sessions/:id', to: 'sessions#destroy'

  post '/search', to: "locations#search", as: 'search'
  get '/search', to: 'events#index'

  post '/rspv', to: "rsvps#update", as: 'rsvps_edit'
end
