class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart_using :shopping_cart_item
  belongs_to :user
  def taxes
    0
  end


end
