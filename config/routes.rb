Rails.application.routes.draw do
  get '/users/new'
  get '/users/create'
  get '/users/show'
  get '/signup', to: 'users#new'
  #post '/users', to: 'users#create'
  post '/users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/', to: 'sessions#new'
  #get '/login', to: 'sessions#new'

  resources :reviews
  resources :reservations
  resources :listings
  resources :users #, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
