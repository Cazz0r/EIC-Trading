Rails.application.routes.draw do
  get '/' => 'default#index', as: :root
end
