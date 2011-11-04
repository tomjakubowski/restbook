Restbook::Engine.routes.draw do
  resources :comments, except: ["edit", "update", "destroy"] # eventually...
  
  root to: "comments#index"
  match "sign" => "comments#new"
end
