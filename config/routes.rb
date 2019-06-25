Rails.application.routes.draw do

  root 'homes#home'
  get 'homes/about'
  devise_for :users
  resources :posts, only: [:new,:create,:index,:show,:destroy] do
  	resource :favorites, only:[:create,:destroy]
    resources :post_comments, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
