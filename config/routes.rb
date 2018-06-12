Rails.application.routes.draw do
  resources :venues
  root 'calendar#index', as: 'calendar_index'

  resources :events
end
