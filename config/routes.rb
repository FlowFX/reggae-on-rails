Rails.application.routes.draw do
  resources :users
  root 'calendar#index', as: 'calendar_index'
  resources :events
  resources :venues
end
