Rails.application.routes.draw do
  root "user#index"
  # resources :user
  get "/register", to: "user#new"
  post "/register", to: "user#create"
  get "/user/:id", to: "user#show", as: "user"
  get "/user/:id/edit", to: "user#edit", as: "edit_user"
  patch "/user/:id", to: "user#update"
  delete "/user/:id", to: "user#destroy", as: "delete_user"
end
