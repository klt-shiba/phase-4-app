Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  resources :users do
    resources :jobs
  end

  resources :jobs, :sessions

  get '/jobs/:id', to: 'jobs#show'
  get '/jobs', to: 'jobs#index'
  get '/create', to: 'jobs#new'
  post '/create', to: 'jobs#create'
  patch '/jobs/:id', to: 'jobs#update'
  get '/jobs/:id/edit', to: 'jobs#edit'
  get 'jobs/delete', to: 'jobs#destroy'
  post 'jobs/delete', to: 'jobs#destroy'

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
