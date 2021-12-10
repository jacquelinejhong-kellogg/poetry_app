Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root :to => "poems#index"
  resources :friend_requests
  resources :likes
  resources :comments
  resources :poets
  resources :poems
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
