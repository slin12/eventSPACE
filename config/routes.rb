Rails.application.routes.draw do
  resources :events
  resources :locations
  resources :users
  resources :rsvps
  resources :locations, only: [:create]
  post '/search', to: "locations#search", as: 'search'
  get '/search', to: 'events#index'
end
