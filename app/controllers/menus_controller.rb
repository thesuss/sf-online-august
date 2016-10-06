class MenusController < ApplicationController
  before_action :find_menu_from_params, only: [:show, :edit, :update]
  before_action :owner_has_restaurant?, only: :new

  load_and_authorize_resource

  def index
  end

  def new
    @menu = Menu.new
    @dishes = current_user.restaurant.dishes
  end

  def show
  end

  def create
    restaurant = Restaurant.find_by(user: current_user)
    @menu = restaurant.menus.new(menu_params)
    if @menu.save
      flash[:notice] = 'Successfully added menu'
      render :show
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  def edit
    @dishes = current_user.restaurant.dishes
  end

  def update
    @menu.update(menu_params)
    render :show
  end

  private
  def menu_params
    params.require(:menu).permit(:title, {dish_ids: []})
  end

  def find_menu_from_params
    @menu = Menu.find(params[:id])
  end
end
