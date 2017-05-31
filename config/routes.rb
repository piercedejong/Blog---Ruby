Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy"

  get '/current_user_articles', to: "users#index"

  #get '/user_articles', to: "user#show"

  get 'users/:id/articles' => 'users#index', :as => :user_articles

  resources :articles do
    resources :comments
  end

  resources :users, only: [:create, :destroy]

  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
