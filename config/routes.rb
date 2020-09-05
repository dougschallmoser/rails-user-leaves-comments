Rails.application.routes.draw do

  resources :posts
  resources :comments
  resources :categories
  resources :users

  root 'posts#index'
  
end
