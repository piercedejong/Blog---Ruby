Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'

  get '/auth/google/callback', to: "users#create"

  resources :articles do
    resources :comments
  end

  resources :users, only: [:create, :destroy]


  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
