require 'rails_helper'

RSpec.describe RestaurantHelper do

  it "returns the restaurant categories, plus 'All Restaurants'" do
    category_list = dropdown_options
    expected_length = Restaurant::PERMITTED_CATEGORIES.length + 1
    expect(category_list.length).to eq expected_length
  end
end
