Rails.application.routes.draw do
	devise_for :users
	resources :posts do
		resources :likes
		resources :comments do
		resources :image
	end
	end
	root 'posts#index'
	end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html