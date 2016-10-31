Rails.application.routes.draw do
  
  get 'blog_posts/index'

  get 'blog_posts/show'

  get 'blog_posts/edit'

  get 'blog_posts/new'

  devise_for :users

  resources :users, only: [:show, :index]

  resources :friendships, only: [:create, :destroy, :accept] do
  	member do 
  		put :accept
  	end
  end


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
