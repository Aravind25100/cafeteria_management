class CartsController < ApplicationController
  def create
    user_cart = Cart.find_by(user_id: @current_user.id)
    if !user_cart
      cart = Cart.create!(date: Date.today, user_id: current_user.id)
      redirect_to cart_items_path(:item_id => params[:item_id], :cart_id => cart.id)
    else
      redirect_to cart_items_path(:item_id => params[:item_id], :cart_id => user_cart.id)
    end
  end

  def show
    render plain: "show cart"
  end

  def destroy
    cart_details = Cart.find_by(user_id: session[:current_user_id])
    if cart_details.id == params[:cart_id].to_i
      cart_details.destroy
    end
    redirect_to delete_cart_items_path(cart_id: params[:cart_id], order_id: params[:order_id])
  end
end
