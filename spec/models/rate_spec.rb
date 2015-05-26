require 'rails_helper'

describe Rate do
  describe '#initialize' do
    it 'requires currency to be set' do
      expect{ Rate.new }.to raise_error ArgumentError
    end

    it 'converts currency to an upper case symbol' do
      rate = Rate.new(currency: 'Gbp')
      expect(rate.currency).to eq :GBP
    end

    it 'allows currency to be a symbol' do
      rate = Rate.new(currency: :Gbp)
      expect(rate.currency).to eq :GBP
    end

    it 'has a default rate of 1.00' do
      rate = Rate.new(currency: 'GBP')
      expect(rate.rate).to eq(1.00)
    end

    it 'converts rate to a BigDecimal' do
      rate = Rate.new(currency: 'GBP', rate: '1.20')
      expect(rate.rate).to be_a BigDecimal
    end

    it 'does not allow rate to be a float' do
      expect{Rate.new(currency: 'GBP', rate: 1.20)}.to raise_error ArgumentError
    end
  end

  describe "#rebase" do
    it 'returns a new instance of Rate rebased against another rate' do
      base_euro_usd_rate = Rate.new(currency: 'USD', rate: '1.11835')
      base_euro_gbp_rate = Rate.new(currency: 'GBP', rate: '0.71514')

      base_gbp_usd_rate = base_euro_usd_rate.rebase(base_euro_gbp_rate)

      expect(base_gbp_usd_rate.rate).to eq(1.56382)
      expect(base_gbp_usd_rate.currency).to eq(:USD)
    end
  end
end
