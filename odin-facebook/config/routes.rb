Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  get  'newsfeed/', to: 'users#newsfeed'
  resources :posts, only: [:new, :create, :show]

end
