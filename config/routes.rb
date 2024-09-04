Rails.application.routes.draw do
  root "user#index"
  resources :user
  get "/register", to: "user#new"
  post "/register", to: "user#create"
  # get "/user/:id", to: "user#show",
  # get "/user/:id/edit", to: "user#edit",
  # patch "/user/:id", to: "user#update"
  delete "/user/:id", to: "user#destroy"
end
