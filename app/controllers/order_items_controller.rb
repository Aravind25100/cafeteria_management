class OrderItemsController < ApplicationController
  def create
    render plain: "Hai"
    # OrderItem.order_items(params[:cart_id], params[:order_id])
    # redirect_to cart_path(cart_id: params[:cart_id]), method: :delete
    # redirect_to "/carts/#{params[:cart_id]}", method: :delete
    # redirect_to :controller => "carts", :action => "destroy", id: params[:cart_id], :method => "delete"
  end
end
