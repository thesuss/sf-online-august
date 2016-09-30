class Menu < ApplicationRecord
  validates_presence_of :title

  has_many :dishes

end
