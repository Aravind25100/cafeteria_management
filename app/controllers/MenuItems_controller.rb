class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def show
    render plain: "Show page"
  end
end
