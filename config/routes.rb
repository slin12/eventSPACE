Rails.application.routes.draw do
  resources :events
  resources :locations
  resources :users
  resources :rsvps



  get '/search', to: 'events#index'
end
