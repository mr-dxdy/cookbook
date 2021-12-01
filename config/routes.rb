Rails.application.routes.draw do
  draw :sessions

  resources :recipes, only: :index
  resources :dishes
  resources :tags
end
