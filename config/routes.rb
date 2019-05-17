Rails.application.routes.draw do
  devise_for :users
    root 'users#show'
resources :users, only: :show
resources :genres
resources :user_checks
end
