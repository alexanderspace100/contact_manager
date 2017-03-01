Rails.application.routes.draw do
  resources :companies

  resources :email_addresses, :except => [:index, :show]

  resources :phone_numbers, :except => [:index, :show]

  resources :people

  resource :sessions, :only => [:create]

  get 'auth/:provider/callback' => 'sessions#create'

  root to: 'companies#index'

  get '/login' => redirect('/auth/twitter')

  delete '/logout' => 'sessions#destroy', as: :logout
    
  # root to: 'companies#index'
  #
  # root 'site#index'
  #
  # resources :companies
  # resources :email_addresses, :except => [:index, :show]
  # resources :phone_numbers, :except => [:index, :show]
  # resources :people
  # get '/auth/:provider/callback' => 'sessions#create'
  #
  # match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  # match '/auth/failure', to: redirect('/'), via: 'get'
  # resource :sessions, :only => [:create, :destroy]
  #
  # get "/login" => redirect("/auth/twitter"), as: :login
  # delete "/logout" => "sessions#destroy", as: :logout
  #
end
