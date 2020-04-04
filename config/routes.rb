Rails.application.routes.draw do
  namespace :api, :constraints => { :format => 'json' } do
    namespace :v1 do
      resources :sessions
      resources :accounts
      resources :orders
      resources :trade_events
      resources :testimonials
      resources :users
    end
  end

  # App V1 Routes
  get '/dashboard' => 'dashboard#index'
  resources :cmdrs
  resources :accounts
  resources :orders
  resources :testimonials
  get '/s/:hash' => 'accounts#statement'
  get '/t/:hash' => 'orders#summary'

  # Default index route
  get '/' => 'default#index', as: :root
end
