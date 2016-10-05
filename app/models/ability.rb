class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.owner?
      can :manage, Menu
      can :manage, Dish
      can :manage, Restaurant
      cannot :create, ShoppingCart
      can :read, :all
    elsif user.customer?
      cannot :manage, Menu
      cannot :manage, Dish
      cannot :manage, Restaurant
      can :manage, ShoppingCart
      can :read, :all
    end

  end
end
