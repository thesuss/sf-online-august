require 'rails_helper'

RSpec.describe 'Owners Abilities', type: :model do
  let(:owner) { create(:user, email: 'owner@random_restaurant.com', role: 'owner') }
  let(:owner_2) { create(:user, email: 'owner_2@random_restaurant.com', role: 'owner') }

  subject { Ability.new(owner) }
  it 'can manage Menus' do
    expect(subject).to be_able_to(:manage, Menu.new)
  end
  it 'can manage Dishes' do
    expect(subject).to be_able_to(:manage, Menu.new)
  end

  it 'can manage his own Restaurants' do
    expect(subject).to be_able_to(:manage, Restaurant.create(attributes_for(:restaurant, user: owner)))
  end

  it 'cannot manage somebody else Restaurants' do
    expect(subject).not_to be_able_to(:manage, Restaurant.create(attributes_for(:restaurant, user: owner_2)))
  end

  it 'can not create ShoppingCart' do
    expect(subject).not_to be_able_to(:create, ShoppingCart)
  end

end