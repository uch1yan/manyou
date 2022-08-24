Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks 
  resources :users, only: [:index, :new, :create, :show, :destroy]

  namespace :admin do 
    resources :users 
  end 
end
