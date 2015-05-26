require 'rails_helper'

describe DailyFeedMapper do
  let(:daily_feed) do
    daily_feed = Data::DailyFeed.create
    daily_feed.rates.create(currency: 'GBP', amount: '1.1234567')
    daily_feed.rates.create(currency: 'USD', amount: '1.5711')
    daily_feed.rates.create(currency: 'EUR', amount: '1.0000')
    daily_feed
  end

  subject { DailyFeedMapper.new(daily_feed) }

  describe "#map" do
    it "sets default currency to EUR" do
      result = subject.map
      expect(result.base.currency).to eq(:EUR)
    end

    it "maps associated rates" do
      result = subject.map

      expect(result.find_currency('GBP').rate).to eq(BigDecimal.new('1.1234567'))
      expect(result.find_currency('USD').rate).to eq(BigDecimal.new('1.5711'))
      expect(result.find_currency('EUR').rate).to eq(BigDecimal.new('1.0000'))
    end
  end
end
