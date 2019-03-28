Rails.application.routes.draw do


  root 'pages#top'

  resources :notifications
  resources :bank_accounts

  resources :books do
  resources :posts
  resources :comments
  end


  resources :users
  get     '/signup', to: 'users#new'
  post    '/signup',  to: 'users#create'

  get '/newpost', to: 'posts#new'

  get '/newbook', to: 'books#new'

  post '/posts/comments', to: 'comments#create'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
