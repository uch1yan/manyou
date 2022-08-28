Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks 
  resources :users
  namespace :admin do 
    resources :users 
  end 
end
