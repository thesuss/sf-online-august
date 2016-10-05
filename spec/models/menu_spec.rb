require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe 'regression test' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_and_belong_to_many :dishes}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:menu)).to be_valid
    end
  end
end
