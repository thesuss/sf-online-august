class User < ApplicationRecord
  has_one :restaurant, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy

  PERMITTED_ROLES = %w(customer owner)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

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

  def has_restaurant?
    self.restaurant != nil && self.restaurant.id != nil
  end
end
