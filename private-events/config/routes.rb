Rails.application.routes.draw do

  root 'static_pages#index'
  get     '/login'  ,       to: 'sessions#new'
  post    '/login'  ,       to: 'sessions#create'
  delete  '/signout',       to: 'sessions#destroy'
  get     '/invitation',    to: 'users#new_invite'
  post    '/invitation',    to: 'users#create_invite'
  post    '/accept_invite', to: 'users#accept_invite'

  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :events, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
end
