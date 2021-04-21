Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  post '/logout', to: "sessions#destroy"

  post '/confirm_reservation', to: "reservations#confirm"

  root 'sessions#new'


  resources :reviews
  resources :reservations, only: [:index, :new, :create]
  resources :listings do
    resources :reservations, shallow: true
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
