Rails.application.routes.draw do
  root to: 'posts#index'

  resources :websites, only: [:new, :create] do
    resources :posts, only: :index
  end

  resources :posts, only: :index
end
