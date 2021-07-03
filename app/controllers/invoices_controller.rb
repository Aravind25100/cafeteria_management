class InvoicesController < ApplicationController
  def create
    total_amount = OrderItem.total_amount(params[:order_id])
    Invoice.create!(
      order_id: params[:order_id],
      user_id: session[:current_user_id],
      total_amount: total_amount,
      address: User.find(session[:current_user_id]).address,
      delivery_status: "pending",
    )
    redirect_to orders_path
  end

  def update
    invoice = Invoice.find_by(order_id: params[:order_id])
    invoice.delivery_status = "delivered"
    invoice.updated_at = DateTime.now()
    invoice.save
    redirect_to orders_path
  end
end
