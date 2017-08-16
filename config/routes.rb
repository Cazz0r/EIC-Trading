Rails.application.routes.draw do
  namespace :api, :constraints => { :format => 'json' } do
    namespace :v1 do
      resources :sessions
    end
  end

  # App V1 Routes
  get '/dashboard' => 'dashboard#index'
  get '/cmdrs' => 'cmdrs#index'
  get '/cmdrs/:id' => 'cmdrs#show'

  # Default index route
  get '/' => 'default#index', as: :root
end
