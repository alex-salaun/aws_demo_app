Rails.application.routes.draw do
  resources :posts, only: [:index, :show]

  devise_for :authors
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'posts#index'
end
