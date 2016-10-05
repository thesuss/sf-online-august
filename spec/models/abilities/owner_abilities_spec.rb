require 'rails_helper'

RSpec.describe 'Owners Abilities', type: :model do
  let(:owner) { create(:user, email: 'owner@randon_restaurant.com', role: 'owner') }

  subject { Ability.new(owner) }
  it 'can manage Menus' do
    expect(subject).to be_able_to(:manage, Menu.new)
  end
  it 'can manage Dishes' do
    expect(subject).to be_able_to(:manage, Menu.new)
  end

  it 'can manage Restaurants' do
    expect(subject).to be_able_to(:manage, Restaurant.new)
  end

  it 'can not create ShoppingCart' do
    expect(subject).not_to be_able_to(:create, ShoppingCart)
  end

end