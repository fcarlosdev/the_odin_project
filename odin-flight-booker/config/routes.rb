Rails.application.routes.draw do


  root "flights#index"
  get  'book', to: 'bookings#new'
  resources :flights, only: [:index]

end
