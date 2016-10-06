class Menu < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :restaurant

  has_and_belongs_to_many :dishes
  belongs_to :restaurant

end
