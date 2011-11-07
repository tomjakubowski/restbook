Rails.application.routes.draw do
  mount Restbook::Engine => "/restbook"

  root to: "home#index"
end
