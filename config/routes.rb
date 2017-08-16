Rails.application.routes.draw do
  namespace :api, :constraints => { :format => 'json' } do
    namespace :v1 do
      resources :sessions
    end
  end

  # App V1 Routes
  get '/dashboard' => 'dashboard#index'
  resources :cmdrs
  resources :accounts

  # Default index route
  get '/' => 'default#index', as: :root
end
