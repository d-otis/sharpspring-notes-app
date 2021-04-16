Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/register", to: 'users#new'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users
  resources :notes, except: :put


end
