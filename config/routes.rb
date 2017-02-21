Rails.application.routes.draw do
  resources :companies
  resources :email_addresses
  resources :phone_numbers, :except => [:index, :show]
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
