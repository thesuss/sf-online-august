class MenuController < ApplicationController
  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params)
    flash[:notice] = "Successfully added menu"
    redirect_to menu_index_path(@menu)
  end

  private
  def menu_params
    params.require(:menu).permit(:title)
  end
end
