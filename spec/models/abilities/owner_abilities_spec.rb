require 'rails_helper'

RSpec.describe 'Owners Abilities', type: :model do
  let(:owner) { create(:user, email: 'owner@randomrestaurant.com', role: 'owner') }
  let(:owner_2) { create(:user, email: 'owner_2@randomrestaurant.com', role: 'owner') }
  let(:restaurant_1) { create(:restaurant, user: owner)}
  let(:restaurant_2) { create(:restaurant, user: owner_2)}
  let(:dish_1) { create(:dish, restaurant: restaurant_1 ) }
  let(:dish_2) { create(:dish, restaurant: restaurant_2 ) }

  subject { Ability.new(owner) }
  it 'can manage Menus' do
    expect(subject).to be_able_to(:manage, Menu.new)
  end

  it 'can manage his own Dishes' do
    expect(subject).to be_able_to(:manage, dish_1)
  end

  it 'cannot manage somebody else\'s Dishes' do
    expect(subject).not_to be_able_to(:manage, dish_2)
  end

  it 'can manage his own Restaurants' do
    expect(subject).to be_able_to(:manage, restaurant_1)
  end

  it 'cannot manage somebody else\'s Restaurants' do
    expect(subject).not_to be_able_to(:manage, restaurant_2)
  end

  it 'can not create ShoppingCart' do
    expect(subject).not_to be_able_to(:create, ShoppingCart)
  end

end