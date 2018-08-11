# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendar#index' # shortcut for the above

  # all your other routes
  # except ActiveStorage, because we want to see our images, too. Solution copied
  # from: https://github.com/rails/rails/issues/31228#issuecomment-352900551
  get '*all', to: 'application#route_not_found', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
