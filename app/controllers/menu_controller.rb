class MenuController < ApplicationController
  def index
    if session[:category] == nil
      session[:category] = "all"
    elsif params[:category].present?
      session[:category] = params[:category]
    end

    render "index", locals: { category: session[:category] }
  end
end
