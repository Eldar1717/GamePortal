Rails.application.routes.draw do
  root 'home#index'

  resources :games, only: [:index, :show] do
    resources :reviews, except: [:new, :show]
    resources :comments, only: [:create] # для комментариев к отзывам
  end

  devise_for :users
end
