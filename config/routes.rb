Rails.application.routes.draw do
  resources :events
  root 'application#hello'
end
