Rails.application.routes.draw do
  resources :messages
  devise_for :users
  resources :rooms
  root to: 'rooms#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
