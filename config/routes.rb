Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  ## Dynamic omniauth provider eg google, facebook, github.
  ## Coming back route 
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :users do
    resources :jobs
  end
  resources :jobs do
    resources :bids
  end

  get 'most_popular', to: 'jobs#popular'

  resources :jobs, :sessions

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  get '/users/:id/edit', to: 'users#edit'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

end
