Rails.application.routes.draw do
  resources :friend_requests
  resources :likes
  resources :comments
  resources :poets
  resources :poems
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
