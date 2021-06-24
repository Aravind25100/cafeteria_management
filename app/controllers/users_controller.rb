class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if User.all.count == 0
      render template: "users/new", locals: { role: "owner" }
    else
      render template: "users/new", locals: { role: "user" }
    end
  end

  def create
    user = User.new(
      name: params[:name],
      role: params[:role],
      address: (params[:address].split(",").map(&:strip).join(",")),
      phone_no: params[:phone_no],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
