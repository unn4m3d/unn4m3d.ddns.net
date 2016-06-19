Rails.application.routes.draw do
  get "posts/new" => "posts#create"
  post "posts/new" => "posts#create"
  get "posts/:id" => "posts#show"
  post "posts/:id/edit" => "posts#update"
  get "posts/:id/edit" => "posts#update"
  get "posts/:id/delete" => "posts#delete"
  root to: "posts#index"

  devise_for :users
end
