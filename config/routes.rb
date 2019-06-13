Rails.application.routes.draw do

  root 'posts#_index'
  get 'favorites/create' => "favorites#create",as: "new_favorite"
  get 'favorites/destroy' => "favorites#destroy",as: "destroy_favorite"
  post 'nices/create' => "nices#create",as: "new_nice"
  delete 'nices/destroy' => "nices#destroy",as: "destroy_nice"

  get '/post/search', to: "search#post_search"
  get '/book/search', to: "search#book_search"


  resources :notifications
  resources :bank_accounts
  resources :posthashtags, only: [:create, :destroy]
  get '/post/hashtag/:name', to: "posts#hashtag"

  resources :relationships,       only: [:create, :destroy]
  
  resources :books do
    resources :posts
    resources :comments
  end

  

  get     '/signup', to: 'users#new'
  post    '/signup',  to: 'users#create'

  resources :withdrawals


  resources :users do
      post 'charge', to:'users#charge'
    member do
      get :following, :followers
      get  'favorites', to:'users#favorites'
    end
  end

  get '/admin', to: 'admin#show'


  get '/newpost', to: 'posts#new'
  get '/posts_request', to: 'posts#map', as: 'posts_request'

  get '/newbook', to: 'books#new'
  get '/books', to: 'books#index'

  # post '/posts/comments', to: 'comments#create'




  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  

end
