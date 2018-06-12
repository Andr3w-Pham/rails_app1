Rails.application.routes.draw do

  resources :comments
  root 'home#page'
  resources :posts
  resources :profiles
  # create a nested routes for attachements in the blogs
  resources :blogs do
    resources :attachments
    member do
      put 'like', to:"blogs#vote"
    end
    resources :comments , only: [:create]
  end
  # devise_for :users
    devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'home/page'
end
