Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions
  resources :tasks 
  resources :users, only: [:new, :create, :show, :destroy]
end
