Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
  root to: 'items#index'
  get 'items/search'
  post 'items/search'
  resources :users
  resources :items, only: [:index, :create, :show, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end
  
  
end
