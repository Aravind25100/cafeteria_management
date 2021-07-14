class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  before_action :check_user

  def check_user
    if (request.path == "/menu" or request.path == "/menu/confirm_order" or request.path == "/users/#{session[:current_user_id]}/edit") and current_user.role == "owner"
      redirect_to root_path
    end
    if ((request.path == "/users" and request.get?) or request.path == "/menu_categories" or request.path == "/add_employees" or request.path == "/edit" or request.path == "/order_reports") and (current_user.role == "user")
      redirect_to menu_index_path
    end
    if ((request.path == "/users" and request.get?) or request.path == "/menu_categories" or request.path == "/add_employees" or request.path == "/edit" or request.path == "/users/#{session[:current_user_id]}/edit" or request.path == "/order_reports") and (current_user.role == "clerk")
      redirect_to menu_index_path
    end
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    #memoization
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
