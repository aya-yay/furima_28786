Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users

  resources :items do
    resources :purchase_items, only: [:order, :index] do
      post 'order', on: :member
      get 'index', on: :member
    end

  end

end