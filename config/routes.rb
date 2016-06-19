Rails.application.routes.draw do

  get 'api/q/:cid/' => 'api_quotes#show'
  post 'api/q/:cid/' => "api_quotes#add"
  get 'api/q/:cid/search' => "api_quotes#search"
  get 'api/q/:cid/:id' => "api_quotes#show"


  get "posts/new" => "posts#create"
  post "posts/new" => "posts#create"
  get "posts/:id" => "posts#show"
  post "posts/:id/edit" => "posts#update"
  get "posts/:id/edit" => "posts#update"
  get "posts/:id/delete" => "posts#delete"
  root to: "posts#index"

  devise_for :users
end
