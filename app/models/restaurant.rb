class Restaurant < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :name, :street, :zipcode, :town
end
