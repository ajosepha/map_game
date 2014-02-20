MapGame::Application.routes.draw do

resources :users do
  resources :sessions, only: [:new, :create, :destroy]

  resources :games do
    post '/purchase', to: "games#purchase"
  end
end

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

resources :game_zips 
end
