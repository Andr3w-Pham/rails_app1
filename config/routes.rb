Rails.application.routes.draw do
  # resources :attachments
  # resources :posts
  resources :profiles
  resources :posts do
    resources :attachments
  end
  # devise_for :users
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'home#page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
