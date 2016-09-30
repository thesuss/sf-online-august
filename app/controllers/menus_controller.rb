class MenusController < ApplicationController
  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Successfully added menu"
      render :index
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  private
  def menu_params
    params.require(:menu).permit(:title)
  end
end
