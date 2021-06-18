Rails.application.routes.draw do
  resources :menu_items
  resources :menu_categories

  get "/" => "home#index"
  get "order", to: "orders#index"
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
