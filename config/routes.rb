Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "sessions#new"

  get "/register", to: 'users#new'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"

  resources :users, except: :index
  resources :notes, except: :put do
    member do
      patch :toggle_pinned
    end
  end

end
