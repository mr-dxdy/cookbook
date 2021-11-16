Rails.application.routes.draw do
  namespace :vkontakte do
    resources :sessions, only: %i[new] do
      collection { get :create }
    end
  end

  resource :sessions, only: %i[new destroy]
  root to: "sessions#new"

  resources :recipes, only: :index
end
