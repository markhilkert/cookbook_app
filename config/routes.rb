Rails.application.routes.draw do
  namespace :api do
    get "/recipes/:id" => 'recipes#show'
    get "/recipes" => 'recipes#index'
    get '/recipes/new' => 'recipes#new'
    post "/recipes" => 'recipes#create'
    post '/sessions' => 'sessions#create'
    patch "/recipes/:id" => 'recipes#update'
    delete "/recipes/:id" => 'recipes#destroy'

    post '/users' => 'users#create'
  end
end