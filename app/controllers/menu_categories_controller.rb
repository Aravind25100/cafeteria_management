class MenuCategoriesController < ApplicationController
  def index
    if session[:edit_category] == nil
      session[:edit_category] = "all"
    elsif params[:category].present?
      session[:edit_category] = params[:category]
    end
    render "index", locals: { category: session[:edit_category] }
  end

  def create
    category = MenuCategory.new(
      name: params[:name],
    )
    if category.save
      redirect_to menu_categories_path
    else
      flash[:error] = category.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end

  def update
    category = MenuCategory.find(params[:id])
    category.name = params[:name]

    if category.save
      redirect_to menu_categories_path
    else
      flash[:error] = category.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end

  def destroy
    MenuItem.where(menu_category_id: params[:id]).destroy_all
    MenuCategory.find(params[:id]).destroy
    redirect_to menu_categories_path
  end
end
