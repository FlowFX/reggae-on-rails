Rails.application.routes.draw do
  root 'calendar#index', as: 'calendar_index'
  resources :events
  resources :venues
end
