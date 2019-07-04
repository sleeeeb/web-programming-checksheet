Rails.application.routes.draw do
  devise_for :users, controllers: {
                       registrations: 'users/registrations',
                       omniauth_callbacks: 'users/omniauth_callbacks',
                     }
  get 'privacy_policy', to: 'contents#privacy_policy'
  get 'enter', to: 'users#enter'
  get 'about', to: 'users#about'
  get 'signup/oauth', to: 'signups#oauth'
  get 'signup/facebook', to: 'signups#oauth_facebook'
  root 'users#index'
  resources :users, only: :show
  resources :genres
  resources :user_checks
  resources :likes, only: [:create, :destroy]
  resources :contents do
    resources :comments
  end
end
