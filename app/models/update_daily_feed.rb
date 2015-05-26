class UpdateDailyFeed
  def update
    ecb_feed = EcbApi.new.euroxref_daily
    daily_feed = Data::DailyFeed.create(feed_updated_at: Time.zone.now)

    attributes = ecb_feed.map do |rate|
      {
        currency: rate['currency'],
        amount: rate['rate']
      }
    end

    daily_feed.rates.create(attributes)
    daily_feed
  end
end
