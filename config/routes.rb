Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/register", to: 'users#new'

  resources :users, except: :index do
    resources :notes, except: :put
  end

end
