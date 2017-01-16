Rails.application.routes.draw do

  
  resources :users, only: [:index,:show,:destroy] do
  	resource :follows, only: [:create,:destroy]
  	get :favorites, on: :member
  	get :follows, on: :member
  	get :followers, on: :member
  end

  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :settings, only: [:edit, :update]
  
  resources :tweets do
  	resources :favorites, only: [:create, :destroy]
  	get	:timeline, on: :collection
  end

  root to: 'registrations#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
