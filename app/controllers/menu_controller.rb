class MenuController < ApplicationController
  def index
    session[:employee_role] = nil
    session[:edit_category] = nil
    if session[:category] == nil
      session[:category] = "all"
    elsif params[:category].present?
      session[:category] = params[:category]
    end

    render "index", locals: { category: session[:category] }
  end

  def show
    render "confirm_order", locals: { cart_id: params[:id] }
  end
end
