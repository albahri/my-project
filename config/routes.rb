Rails.application.routes.draw do
	
  resources :locations

  resources :posts
  resources :sampleforms
  get 'sampleform/new', as: 'new'

  devise_for :users
  get 'pages/account'

  get 'pages/youtube', as: 'youtube'
  get 'pages/twitter', as: 'twitter'

match '/auth/:provider/callback' => 'sessions#create', via: :get
# match '/signout' => 'sessions#destroy', :as => "signout"

  resources :authentications
  # get "log_out" =>"sessions#destroy", :as =>"log_out"
  # get "log_in" =>"sessions#new", :as =>"log_in"
  # get "sign_up" => "users#new", :as => "register"
  root to: "posts#index"
  # resources :users
  # resources :sessions
end

