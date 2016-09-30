require 'rails_helper'

RSpec.describe ShoppingCartItem, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :owner_id }
    it { is_expected.to have_db_column :owner_type }
    it { is_expected.to have_db_column :quantity }
    it { is_expected.to have_db_column :item_id }
    it { is_expected.to have_db_column :item_type }
    it { is_expected.to have_db_column :price_cents }
    it { is_expected.to have_db_column :price_currency }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:price_cents).with_message('is not a number') }
  end
end
