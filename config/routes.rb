Rails.application.routes.draw do
  get 'contact', to: "contact#index" 
  post 'contact', to: "contact#mail"
  get 'contact/index'
  get 'contact/mail'
  resources :products
  resources :sellers
  get 'follow/page'
  root 'home#page'
  resources :posts
  resources :profiles
  resources :followings
  # create a nested routes for attachements in the blogs
  resources :blogs do
    resources :attachments
    member do
      put 'like', to:"blogs#vote"
    end
       resources :comments
  end
  # devise_for :users
    devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
