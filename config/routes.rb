  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: 'items#index'
  # get 'items/index'←いらないかも？
  resources :items


end
