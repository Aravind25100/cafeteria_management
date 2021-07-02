Rails.application.routes.draw do
  root to: "home#index"

  resources :menu_items
  resources :menu_categories
  resources :users
  resources :orders
  resources :menu

  put "/changelocation", to: "users#change_location", as: :change_location

  resources :carts
  get "deletecart", to: "carts#destroy", as: :delete_cart

  get "/orderitem", to: "order_items#create", as: :order_items

  get "/invoices", to: "invoices#create", as: :invoices
  put "invoices/id", to: "invoices#update", as: :update_invoices

  get "/cartitem", to: "cart_items#create", as: :cart_items
  put "cartitems/id", to: "cart_items#update", as: :update_cart_items
  get "cartitems/id", to: "cart_items#destroy", as: :delete_cart_items

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
