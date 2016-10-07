require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#flash_class' do
    it 'returns \'alert alert-success\' on \'notice\'' do
      expect(helper.flash_class(:notice)).to eq 'alert alert-success'
    end
    it 'returns \'warning\' on \'warning\'' do
      expect(helper.flash_class(:alert)).to eq 'alert alert-danger'
    end
  end

end