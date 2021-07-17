Rails.application.routes.draw do
  root to: 'entries#index'
  resources :feeds, only: [:new, :create]
end
