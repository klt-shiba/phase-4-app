Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'sessions#home'

  resources :users, only: [:show, :new, :create, :index]

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'


end
