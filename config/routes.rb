Rails.application.routes.draw do
  
  root "welcome#home"

  get '/signup' => "users#new"
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"
  post '/users/:id' => "users#show"

  resources :attractions
  resources :rides
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
