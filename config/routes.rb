MapGame::Application.routes.draw do

root :to => "users#index"
resources :users do
resources :sessions, only: [:new, :create, :destroy] 
    match '/signup',  to: 'users#new'          
    match '/signin',  to: 'sessions#new'     
   match '/signout', to: 'sessions#destroy',     via: 'delete'

  resources :games do
    post '/purchase', to: "games#purchase"
  end
end



resources :game_zips 
end
