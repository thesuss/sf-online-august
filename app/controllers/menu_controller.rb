class MenuController < ApplicationController
  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = menu.create(menu_params)
    flash[:notice] = "Successfully added menu"
  end
end
