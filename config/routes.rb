# frozen_string_literal: true

Rails.application.routes.draw do

  root 'sessions#home'
  get 'signup', to: 'users#new'
post 'signup', to: 'users#create'
resources :users, except:[:new,:create]
resources :microposts
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
