Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#home'
  get  'timeline/:id',         to: 'users#timeline',         as: :timeline
  get  'friends/:id',          to: 'users#friends',          as: :friends
  get  'friends_requests/:id', to: 'users#friends_requests', as: :friends_requests

  resources :users, only: [:index]
  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:new, :create, :show]
  resources :profiles, only: [:show, :edit, :update]
  resources :friendships, only: [:create, :destroy, :update]

end
