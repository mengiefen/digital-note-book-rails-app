Rails.application.routes.draw do
  post '/note_links', to: 'note_links#create'
  
  resources :insights
  resources :literatures
  resources :notes
  devise_for :users
  root to: 'homes#index'
end
