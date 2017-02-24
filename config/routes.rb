Rails.application.routes.draw do
  root to: 'companies#index'
  resources :companies
  resources :email_addresses, :except => [:index, :show]
  resources :phone_numbers, :except => [:index, :show]
  resources :people
  # get '/auth/:provider/callback' => 'sessions#create'
  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
  resource :sessions, :only => [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
