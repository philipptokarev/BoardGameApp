Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  namespace :admin do
    root to: "base#index"

    resources :games
  end

  resources :users, only: %i[index show] do
    resources :message, only: %i[index]
    post "send_message", to: "message#contact"
  end
  resources :games, only: %i[index show] do
    resources :reviews
  end

  get "edit_user/:id", to: "users#edit", as: "edit_info"
  patch "users/:id", to: "users#update"
end
