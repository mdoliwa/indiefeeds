Rails.application.routes.draw do
  root to: 'feeds#new'
  resources :feeds, only: [:new, :create]
end
