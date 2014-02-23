MapGame::Application.routes.draw do

root :to => "users#index"
resources :users do
  match '/signup',  to: 'users#new',            via: 'get'
  resources :sessions, only: [:new, :create, :destroy]
    match '/signup',  to: 'users#new',            via: 'get'
    match '/signin',  to: 'sessions#new',         via: 'get'
    match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :games do
    post '/purchase', to: "games#purchase"
  end
end



resources :game_zips 
end
