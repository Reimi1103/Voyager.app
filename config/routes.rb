Rails.application.routes.draw do


  root 'pages#top'

  resources :notifications
  resources :bank_accounts
  resources :books
  resources :posts
  resources :users
  get     '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get '/newpost', to: 'posts#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
