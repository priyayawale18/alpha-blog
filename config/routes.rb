Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'blog#index'
  get 'about', to:'blog#about'
   #create all routes
  resources:articles
  get 'signup', to: 'user_logs#new'
  post 'signup', to: 'user_logs#create' 

  resources :user_logs

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :categories, except: [:destory]
 
end
