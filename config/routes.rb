# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendar#index' # shortcut for the above

  # all your other routes
  match '*unmatched', to: 'application#route_not_found', via: :all
end
