class Restaurant < ApplicationRecord

  PERMITTED_CATEGORIES = %w(Other Pizza Sushi Italian Thai Fast\ Food BBQ French Traditional Vegan Seafood TexMex)

  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :dishes, dependent: :destroy
  geocoded_by :full_address
  after_validation :geocode
  validates_presence_of :user, :name, :category, :street, :zipcode, :town
  validates :category, inclusion: { in: PERMITTED_CATEGORIES,
                                    message: '%{value} is not permitted'}


  def full_address
    [street, zipcode, town].join(', ')
  end

  def has_menus?
    self.menus != nil && self.menus.ids != nil
  end
end
