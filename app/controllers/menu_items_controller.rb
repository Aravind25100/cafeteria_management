class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def show
    render plain: "Show page"
  end

  def create
    new_item = MenuItem.new(
      name: params[:name],
      menu_category_id: params[:menu_category_id],
      description: params[:description],
      price: params[:price],
    )
    if new_item.save
      redirect_to menu_categories_path
    else
      flash[:error] = new_item.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end

  def update
    item = MenuItem.find(params[:id])
    item.name = params[:name].present? ? params[:name] : item.name
    item.description = params[:description].present? ? params[:description] : item.description
    item.price = params[:price].present? ? params[:price] : item.price

    if item.save
      redirect_to menu_categories_path
    else
      flash[:error] = item.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end

  def destroy
    MenuItem.find(params[:id]).destroy
    redirect_to menu_categories_path
  end
end
