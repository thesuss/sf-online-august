require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe "regression test" do
    it { is_expected.to have_db_column :title }

  end

  describe "validations" do
    it { is_expected.to validate_presence_of :title }    
  end
end
