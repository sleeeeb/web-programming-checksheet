Rails.application.routes.draw do
devise_for :users

get 'enter', to: 'users#enter'
get 'about', to: 'users#about'
root 'users#index'
resources :users, only: :show
resources :genres
resources :user_checks
resources :likes, only: [:create, :destroy]
  resources :contents do
    resources :comments
  end
end