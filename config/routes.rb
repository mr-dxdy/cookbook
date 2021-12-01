Rails.application.routes.draw do
  draw :sessions

  resources :recipes, only: :index
  resources :dishes, only: %i[new create edit update]
  resources :tags, only: %i[new create]
end
