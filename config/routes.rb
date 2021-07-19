Rails.application.routes.draw do
  root to: 'entries#index'

  resources :feeds, only: [:new, :create] do
    resources :entries, only: :index
  end

  resources :entries, only: :index
end
