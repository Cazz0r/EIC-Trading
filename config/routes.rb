Rails.application.routes.draw do
  namespace :api, :constraints => { :format => 'json' } do
    namespace :v1 do
      resources :sessions
      resources :accounts
      resources :orders
      resources :trade_events
    end
  end

  # App V1 Routes
  get '/dashboard' => 'dashboard#index'
  resources :cmdrs
  resources :accounts
  resources :orders
  get '/s/:hash' => 'accounts#statement'
  get '/t/:hash' => 'orders#summary'

  # Default index route
  get '/' => 'default#index', as: :root
end
