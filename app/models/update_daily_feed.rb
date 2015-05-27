class UpdateDailyFeed
  def update
    ecb_feed = EcbApi.new.euroxref_daily
    daily_feed = Dao::DailyFeed.create(feed_updated_at: Time.zone.now)

    ecb_feed.each do |rate|
      daily_feed.rates.create({
        currency: rate['currency'],
        amount: BigDecimal.new(rate['rate'])
      })
    end

    daily_feed
  end
end
