namespace :vkontakte do
  resources :sessions, only: %i[new] do
    collection { get :create }
  end
end

resource :sessions, only: %i[new destroy]
root to: "sessions#new"

resources :guest_sessions, only: [:new]
