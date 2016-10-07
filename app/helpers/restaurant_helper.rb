module RestaurantHelper
  def dropdown_options
    Restaurant::PERMITTED_CATEGORIES.dup.insert(0, 'All Restaurants')
  end
end
