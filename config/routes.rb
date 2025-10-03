# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'

  # Добавляем маршрут для игр
  get 'games', to: 'games#index'

  # Devise маршруты (должны быть уже)
  devise_for :users
end
