Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  #post '/users', to: 'users#create'
  post '/signup', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  get '/logout', to: "sessions#destroy"
  post '/logout', to: "sessions#destroy"

  post '/confirm_reservation', to: "reservations#confirm"

  #get '/', to: 'sessions#new'
  root 'sessions#new'
  #get '/login', to: 'sessions#new'

  resources :reviews
  #resources :reservations
  resources :listings do
    resources :reservations, shallow: true
  end
  resources :users #, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
