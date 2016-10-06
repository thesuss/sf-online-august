class MenusController < ApplicationController
  before_action :find_menu_from_params, only: [:show, :edit, :update]
  before_action :owner_has_restaurant?, only: :new

  load_and_authorize_resource

  def index
    @headline = "All menues"
  end

  def new
    @menu = Menu.new
    @dishes = current_user.restaurant.dishes
    @headline = "Add menu to your restaurant"
  end

  def show
    @headline = "#{@menu.title} for #{@menu.restaurant.name}"
  end

  def create
    restaurant = Restaurant.find_by(user: current_user)
    @menu = restaurant.menus.new(menu_params)
    if @menu.save
      flash[:notice] = 'Successfully added menu'
      @headline = "#{@menu.title} for #{@menu.restaurant.name}"
      render :show
    else
      flash[:alert] = @menu.errors.full_messages.first
      render :new
    end
  end

  def edit
    @dishes = current_user.restaurant.dishes
    @headline = "Edit menu: #{@menu.title}"
  end

  def update
    @menu.update(menu_params)
    @headline = "#{@menu.title} for #{@menu.restaurant.name}"
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
