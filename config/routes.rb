Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  
  post '/logout', to: "sessions#destroy"

  post '/confirm_reservation', to: "reservations#confirm"

  root 'sessions#new'

  resources :users
  resources :listings do
    resources :reservations, shallow: true
    resources :reviews, shallow: true
  end
  resources :reservations, only: [:index]
  resources :reviews, only: [:index, :new, :create]

  match '*path' => 'errors#error_404', via: :all
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
