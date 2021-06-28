Rails.application.routes.draw do
  resources :menu_items
  resources :menu_categories
  resources :users
  resources :carts
  resources :orders
  resources :menu

  get "/orderitem", to: "order_items#create", as: :order_items

  get "/cartitem", to: "cart_items#create", as: :cart_items
  put "cartitems/id", to: "cart_items#update", as: :update_cart_items

  root to: "home#index"

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
