require 'rails_helper'

describe 'StripePayment' do

  before do
    class FakeController < ApplicationController
      include StripePayment
    end
    StripeMock.start
  end

  after do
    Object.send :remove_const, :FakeController
    StripeMock.stop
  end

  let(:controller) { FakeController.new }
  let(:cart) { create(:shopping_cart)}
  let(:params) { {}}

  describe '#perform_payment' do
    it 'on success' do
      allow(cart).to receive(:total).and_return 100
      expect(StripePayment.perform_payment(params, cart).class).to eq Stripe::Charge
    end

    it 'on error' do
      allow(cart).to receive(:total).and_return 0
      expect(StripePayment.perform_payment(params, cart)).to eq 'Invalid positive integer Please try again'
    end
  end

end