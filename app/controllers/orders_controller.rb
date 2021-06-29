class OrdersController < ApplicationController
  def index
    session[:edit_category] = nil
    render "index"
  end

  def create
    # new_order = cart_to_order(params[:cart_id])
    redirect_to order_items_path(cart_id: params[:cart_id])
  end
end
