Rails.application.routes.draw do
  resources :insights
  resources :literatures
  resources :notes
  devise_for :users
  root to: 'homes#index'
end
