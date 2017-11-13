Rails.application.routes.draw do
  resources :events
  resources :locations
  resources :users
  resources :rsvps
end
