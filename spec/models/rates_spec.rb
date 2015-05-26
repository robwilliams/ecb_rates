require 'rails_helper'

describe Rates do

  subject { described_class.new(Rate.new(currency: 'EUR')) }

  describe '#initialize' do
    it 'requires base to be set' do
      expect{ Rates.new }.to raise_error ArgumentError
    end
  end

  describe "#add" do
    it "appends to rates" do
      rate = Rate.new(currency: 'GBP', rate: '0.71514')

      subject.add(rate)

      expect(subject).to include(rate)
    end

    it "does not allow duplicate countries to be added" do
      gbp = Rate.new(currency: 'GBP', rate: '0.71514')

      subject.add(gbp)

      expect { subject.add(gbp) }.to raise_error DuplicateCurrencyError
    end
  end

  describe "#find_currency" do
    it "fetches rate by currency" do
      rate = Rate.new(currency: 'FETCHME')
      subject.add(rate)

      expect(subject.find_currency('FETCHME')).to eq(rate)
    end
  end

  describe "#rebase" do
    #before do
      #@base         = Rate.new currency: 'EUR', rate: '1'
      #@new_base     = Rate.new currency: 'GBP', rate: '2'
      #@another_rate = Rate.new currency: 'USD', rate: '1.3'

      #@rates = Rates.new(@base).
                     #add(@new_base).
                     #add(@another_rate)

      #@new_rates = @rates.rebase(@new_base)
    #end

    #it "rebases rates" do
      #expect(@new_rates.fetch('EUR').rate).to eq(0.5)
      #expect(@new_rates.fetch('GBP').rate).to eq(1)
      #expect(@new_rates.fetch('USD').rate).to eq(0.65)
    #end
  end
end
