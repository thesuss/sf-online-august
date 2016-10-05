class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  geocoded_by :full_address
  after_validation :geocode
  validates_presence_of :user, :name, :street, :zipcode, :town

  def full_address
    [street, zipcode, town].join(', ')
  end
end
