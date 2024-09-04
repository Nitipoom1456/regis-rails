Rails.application.routes.draw do
  root "user#index"
  get "/register", to: "user#new"
  post "/resgister", to: "user#create"
  # get "/register" => "users#new", as: :new_user
  # post "users" => "users#create"
  # get "users/:id" => "users#show", as: :user
  # get "users/:id/edit" => "users#edit", as: :edit_user
  # patch "users/:id" => "users#update"
  # delete "users/:id" => "users#destroy"
end
