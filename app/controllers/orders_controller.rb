class OrdersController < ApplicationController
  def index
    session[:edit_category] = nil
    render "index"
  end

  def create
    redirect_to order_items_path
  end
end
