class Dish < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :restaurant

  has_and_belongs_to_many :menus
  belongs_to :restaurant
end
