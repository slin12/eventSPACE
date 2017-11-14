Rails.application.routes.draw do
  resources :events
  resources :locations, only: [:new, :create]
  resources :users, except: [:index]
  resources :rsvps

  # Landing Page
  get '/', to: "static#home", as: 'root'

  # Dashboard Page
  get '/user/dashboard', to: 'users#dashboard'

  # User Authentication routes
<<<<<<< HEAD
  post "/login", to: "sessions#create"
  post "/sessions/:id", to: "sessions#destroy", as: "logout"
=======
  post '/login', to: 'sessions#create'
  post '/sessions/:id', to: 'sessions#destroy'
>>>>>>> ux_dashboard

  post '/search', to: "locations#search", as: 'search'
  get '/search', to: 'events#index'
end
