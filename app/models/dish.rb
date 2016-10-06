class Dish < ApplicationRecord
  validates_presence_of :dish_name
  validates_presence_of :dish_desc
  validates_presence_of :dish_price
  validates_presence_of :restaurant

  has_and_belongs_to_many :menus
  belongs_to :restaurant
end
