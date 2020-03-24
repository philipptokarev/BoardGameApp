Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  namespace :admin do
    root to: "base#index"

    resources :games
  end

  resources :users, only: [:index, :show]
  resources :games, only: [:index, :show] do
    resources :reviews
  end

  get "contact/:id", to: "users#contact", as: "contact"
  get "edit_user/:id", to: "users#edit", as: "edit_info"
  patch "users/:id", to: "users#update"
  post "send_message", to: "users#send_msg", as: "send_msg"
end
