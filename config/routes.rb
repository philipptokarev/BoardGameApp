Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  namespace :admin do
    root to: 'base#index'

    resources :games
  end

  get 'catalog', to: 'games#index'
  resources :games, only: [:show] do
    resources :reviews
  end
end
