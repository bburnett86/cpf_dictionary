Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'words#home'
  resources :words, except: [:show]
  get 'results' => 'words#results'
  get 'list' => 'words#list'

  resources :session, only: [:create, :new, :destroy]
  
end