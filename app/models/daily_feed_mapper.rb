class DailyFeedMapper
  def initialize(feed)
    @feed = feed
  end

  def map
    rates = Rates.new Rate.new(currency: 'EUR')
    feed.rates.each do |rate|
      rates.add Rate.new(currency: rate.currency, rate: rate.amount)
    end
    rates
  end

  private
  attr_reader :feed
end
