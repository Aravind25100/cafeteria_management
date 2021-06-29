class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, except: %i[edit]

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

  def edit
    render "edit", locals: { user_id: session[:current_user_id] }
  end

  def update
    user = User.find(params[:id])
    if (user && user.authenticate(params[:password]))
      user.name = params[:name].present? ? params[:name] : user.name
      user.address = params[:address].present? ? params[:address] : user.address
      user.phone_no = params[:phone_no].present? ? params[:phone_no] : user.phone_no
      user.email = params[:email].present? ? params[:phone_no] : user.email

      if user.save
        redirect_to menu_index_path
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to menu_index_path
      end
    end
  end
end
