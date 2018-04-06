Rails.application.routes.draw do
  resources :events
  resources :venues
  root 'events#index'
end
