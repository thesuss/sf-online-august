class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  has_many :dishes

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  validates_presence_of :user, :name, :street, :zipcode, :town

  def full_address
    [street, zipcode, town].join(', ')
  end

  def full_address_changed?
    if  self.zipcode_changed? || self.street_changed? || self.town_changed?
      true
    else
      false
    end
  end
end
