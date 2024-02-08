Rails.application.routes.draw do

  resources :bblogs do
    resources :posts do
      resources :comments
    end
  end
  
  # resources :posts



  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  #get 'home/index'
  get 'home/header'
  get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
