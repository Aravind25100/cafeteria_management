class CartsController < ApplicationController
  def create
    user_cart = Cart.find_by(user_id: @current_user.id)
    if !user_cart
      cart = Cart.create!(date: Date.today, user_id: current_user.id)
      redirect_to cart_items_path(:item_id => params[:item_id], :cart_id => user_cart)
    else
      redirect_to cart_items_path(:item_id => params[:item_id], :cart_id => user_cart)
    end
  end
end
