class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, except: %i[edit]

  def index
    if session[:employee_role] == nil
      session[:employee_role] = "owner"
    elsif params[:role].present?
      session[:employee_role] = params[:role]
    end
    render "users", locals: { employee_role: session[:employee_role] }
  end

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

  def add_employees
    render "users/add_employee", locals: { role: params[:role] }
  end

  def create_employee
    user = User.new(
      name: params[:name],
      role: params[:role],
      address: (params[:address].split(",").map(&:strip).join(",")),
      phone_no: params[:phone_no],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      redirect_to users_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to add_employees_path
    end
  end

  def edit_employees
    render "edit_employee", locals: { employee_id: params[:user_id] }
  end

  def update_employees
    user = User.find(params[:employee_id])
    user.name = params[:name].present? ? params[:name] : user.name
    user.address = params[:address].present? ? params[:address] : user.address
    user.phone_no = params[:phone_no].present? ? params[:phone_no] : user.phone_no
    user.email = params[:email].present? ? params[:phone_no] : user.email

    if user.save
      redirect_to users_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to edit_employees_path
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

  def change_location
    user = User.find(session[:current_user_id])
    if (user && user.authenticate(params[:password]))
      user.address = params[:address].present? ? params[:address] : user.address
      user.phone_no = params[:phone_no].present? ? params[:phone_no] : user.phone_no
      if user.save
        redirect_to menu_path(Cart.find_by(user_id: session[:current_user_id]).id)
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to menu_path(Cart.find_by(user_id: session[:current_user_id]).id)
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
