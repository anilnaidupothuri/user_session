# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#home'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: %i[new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  #resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
