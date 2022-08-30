Rails.application.routes.draw do
  resources :labels
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks 
  resources :users
  namespace :admin do 
    resources :users 
  end 
end
