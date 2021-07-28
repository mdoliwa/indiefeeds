Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :websites, only: [:new, :create] do
    resources :posts, only: :index
  end

  resources :posts, only: [:index, :show] do
    resources :comments
    resource :upvotes, only: [:create, :destroy]
  end
end
