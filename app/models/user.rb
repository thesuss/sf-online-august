class User < ApplicationRecord
  has_one :restaurant
  has_many :shopping_carts

  PERMITTED_ROLES = %w(customer owner)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :address, :role

  validates :role, inclusion: { in: PERMITTED_ROLES,
                                message: '%{value} is not permitted'}

  scope :customers, -> { where(role: 'customer') }
  scope :owners, -> { where(role: 'owner') }

  def owner?
    self.role == 'owner'
  end

  def customer?
    self.role == 'customer'
  end
end
