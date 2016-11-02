Rails.application.routes.draw do

  devise_for :users

  resources :blog_posts

  resources :users, only: [:show, :index]

  resources :friendships, only: [:create, :destroy, :accept] do
  	member do 
  		put :accept
  	end
  end

  resources :comments, only: [:edit, :create, :udpate, :destroy]

  resources :posts, only: [:create, :update, :edit, :destroy]

  resources :activities, only: [:index]

  root 'welcome#index'

  get 'your_posts' => 'blog_posts#your_posts'

  get 'user_profile' => 'blog_posts#user_profile'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
