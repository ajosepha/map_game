MapGame::Application.routes.draw do

resources :users do
  resources :games do
    post '/purchase', to: "games#purchase"
  end
end

end
