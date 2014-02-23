MapGame::Application.routes.draw do

#resources :users do
  resources :games do
    post '/purchase', to: "games#purchase"
  end
end
#root : 
resources :game_zips 
end
