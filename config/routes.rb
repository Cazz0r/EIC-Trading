Rails.application.routes.draw do
	namespace :api, :constraints => { :format => 'json' } do
		namespace :v1 do
			resources :sessions
		end
	end
	get '/dashboard' => 'default#dashboard'
  get '/' => 'default#index', as: :root
end
