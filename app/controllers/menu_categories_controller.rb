class MenuCategoriesController < ApplicationController
  def index
    render "index"
  end

  def create
    category = MenuCategory.new(
      name: params[:name],
    )
    if category.save
      redirect_to menu_index_path
    else
      flash[:error] = category.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end
end
