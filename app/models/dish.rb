class Dish < ApplicationRecord
  validates_presence_of :dish_name
  validates_presence_of :dish_desc
  validates_presence_of :dish_price
end
