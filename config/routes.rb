# For details on the DSL available within this file, see
# https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users

  get 'signup', to: 'users#new', as: 'signup'

  root 'posts#index'
end
