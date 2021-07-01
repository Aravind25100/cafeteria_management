class OrderItemsController < ApplicationController
  def create
    OrderItem.order_items(params[:cart_id], params[:order_id])
    redirect_to delete_cart_path(cart_id: params[:cart_id], order_id: params[:order_id])
  end
end
