require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
    it { is_expected.to have_db_column :provider }
    it { is_expected.to have_db_column :uid }
    it { is_expected.to have_db_column :tokens }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :role }
  end

  describe 'associations' do
    it { is_expected.to have_many(:shopping_carts).dependent(:destroy) }
    it { is_expected.to have_one(:restaurant).dependent(:destroy) }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:user)).to be_valid
    end
  end

  describe '#role' do
    it 'is a customer by default' do
      expect(subject.role).to eq 'customer'
    end

    it 'can set the role to restaurant owner' do
      owner = create(:user, role: 'owner')
      expect(owner).to be_valid
    end

    it 'returns true on #owner? if role == \'owner\'' do
      rest_owner = create(:user, role: 'owner')
      expect(rest_owner.owner?).to eq true
    end

    it 'returns false on #rest_owner? if role != \'owner\'' do
      not_rest_owner = create(:user, role: 'customer')
      expect(not_rest_owner.owner?).to eq false
    end

    it 'cannot set the role to \'whatever\'' do
      expect { create(:user, role: 'whatever') }
          .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Role whatever is not permitted')
    end
  end

  describe 'scopes' do
    let(:customer) { create(:user, role: 'customer') }
    let(:owner) { create(:user, email: 'whatever@randomrestaurant.com', role: 'owner') }

    it '#customers' do
      expect(User.customers).to include customer
      expect(User.customers).not_to include owner
    end

    it '#owners' do
      expect(User.owners).to include owner
      expect(User.owners).not_to include customer
    end
  end

  describe 'Owner methods' do
    let(:owner) { create(:user, email: 'whatever@randomrestaurant.com', role: 'owner') }
    let(:restaurant) { create(:restaurant, user: User.first) }

    it 'has a restaurant' do
      owner.name = "Fred"
      restaurant.name = "Fred's Restaurant"
      # I know this is stupid, but the user and restaurant weren't showing up in this 'it' block!
      expect(owner.has_restaurant?).to eq true
    end

  end
end
