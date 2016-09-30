require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :created_at }
  end
end
