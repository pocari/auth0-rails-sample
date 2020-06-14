Rails.application.routes.draw do
  get 'dashboard/show'
  root 'home#show'

  get 'home/show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'dashboard' => 'dashboard#show'
  post 'logout' => 'logout#logout'
  resources :users, only: [:new, :create]
end
