class MenuController < ApplicationController
  def index
  end

  def new
    @menu = Menu.new
  end
end
