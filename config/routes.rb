Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'signup' => 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :reviews
  resources :reservations
  resources :cities
  resources :listings
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
