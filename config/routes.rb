Rails.application.routes.draw do
  resources :comments
  resources :routines
  root 'sessions#home'
  get '/signup' => 'users#new'
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #logout route
  delete 'logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
