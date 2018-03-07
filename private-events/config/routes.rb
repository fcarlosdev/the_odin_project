Rails.application.routes.draw do

  root 'static_pages#index'
  get    '/login'  ,       to: 'sessions#new'
  post   '/login'  ,       to: 'sessions#create'
  delete '/signout',       to: 'sessions#destroy'
  get    '/signup',        to: 'users#new'
  post   '/signup',        to: 'users#create'
  get    '/invitation',    to: 'users#new_invite'
  post   '/invitation',    to: 'users#create_invite'
  post   '/accept_invite', to: 'users#accept_invite'

  resources :users
  resources :events, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
end
