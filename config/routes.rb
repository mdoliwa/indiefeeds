Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :websites, only: [:new, :create] do
    scope module: 'websites' do
      resources :posts, only: :index
    end
  end

  resources :posts, only: [:index, :show] do
    resources :comments do
      resources :comments, only: [:new, :create]
    end
  end

  resources :new_posts, only: [:index]

  resources :posts, only: [] do
    resource :upvotes, only: [:create, :destroy]
  end

  resources :comments, only: [] do
    resource :upvotes, only: [:create, :destroy]
  end

  resources :users, only: [:show] do
    scope module: 'users' do
      resources :comments, only: :index
      resources :upvoted_posts, only: :index
      resources :upvoted_comments, only: :index
    end
  end
end
