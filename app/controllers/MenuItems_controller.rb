class MenuItemsController < ApplicationController
  def index
    render plain: "Items page"
  end

  def show
    render plain: "Show page"
  end
end
