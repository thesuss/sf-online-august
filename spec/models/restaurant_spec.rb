require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  describe 'regression test' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description}
    it { is_expected.to have_db_column :street}
    it { is_expected.to have_db_column :zipcode}
    it { is_expected.to have_db_column :town}
    it { is_expected.to have_db_column :latitude}
    it { is_expected.to have_db_column :longitude}
    it {is_expected.to belong_to :user}
    it {is_expected.to validate_presence_of :user}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :street}
    it { is_expected.to validate_presence_of :zipcode}
    it { is_expected.to validate_presence_of :town}
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:restaurant)).to be_valid
    end
  end

  describe 'geocoding' do
    it 'should generate a full address from Factory' do
      expect(create(:restaurant).full_address).to eq "Fjällgatan 3, 41463, Gothenburg"
    end
  end

end
