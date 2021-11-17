Rails.application.routes.draw do
  draw :sessions

  resources :recipes, only: :index
end
