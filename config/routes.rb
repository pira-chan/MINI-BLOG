Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
  get 'posts/please_login' => 'posts#please_login'
  resources :posts
  get   'users/:id'   =>  'users#show' 


end
