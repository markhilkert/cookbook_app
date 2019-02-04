Rails.application.routes.draw do
  namespace :api do
    get "/recipes/:id" => 'recipes#show'
    get "/recipes" => 'recipes#index'
    post "/recipes" => 'recipes#create'
    post '/sessions' => 'sessions#create'
    patch "/recipes/:id" => 'recipes#update'
    delete "/recipes/:id" => 'recipes#destroy'
  end
end