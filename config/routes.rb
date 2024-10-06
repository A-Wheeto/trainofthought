Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'rooms', to: 'rooms#index'

  resources :users
  resources :rooms do
    resources :messages
  end

  # Defines the root path route ("/")
  root "rooms#index"
end
