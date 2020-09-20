Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
  root 'items#index'
  get 'items/search'
  post 'items/search'
  get 'reviews/list'
  post 'reviews/list'
  get 'users/favorite'
  get 'users/review'
  resources :users
  resources :items, only: [:index, :create, :show, :destroy]
  resources :reviews, only: [:new, :create, :show, :destroy]
  
  
end
