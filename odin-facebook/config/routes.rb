Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#home'
  get  'newsfeed/',   to: 'users#newsfeed'

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:new, :create, :show]
  resources :profiles, only: [:show, :edit, :update]

end
