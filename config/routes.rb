Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy"

  resources :articles do
    resources :comments
  end

  resources :users, only: [:create, :destroy]

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
