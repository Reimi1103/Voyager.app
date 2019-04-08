Rails.application.routes.draw do

  root 'pages#top'
  get 'favorites/create' => "favorites#create",as: "new_favorite"
  get 'favorites/destroy' => "favorites#destroy",as: "destroy_favorite"



  resources :notifications
  resources :bank_accounts
  resources :nices, only: [:create, :destroy]
  resources :posthashtags, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
  resources :books do
    resources :posts
    resources :comments
  end


  resources :users
  get     '/signup', to: 'users#new'
  post    '/signup',  to: 'users#create'

  resources :users do
    member do
      get :following, :followers
    end
  end


  get '/newpost', to: 'posts#new'

  get '/newbook', to: 'books#new'
  get '/books', to: 'books#index'

  post '/posts/comments', to: 'comments#create'




  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  

end
