Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'words#home'
  resources :words, except: [:show] do 
	  collection do
	    post :import
	  end
	end
  get 'results' => 'words#results'

  resources :session, only: [:create, :new, :destroy]
  
  resources :word_imports, only: [:create, :new]
end