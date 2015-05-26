require 'rails_helper'

RSpec.describe Dao::DailyFeed, type: :model do
  describe ".latest" do
    it "is the record with the most recently updated feed_updated_at column" do
      new = Dao::DailyFeed.create(feed_updated_at: Time.now)
      old = Dao::DailyFeed.create(feed_updated_at: 1.week.ago)

      expect(Dao::DailyFeed.latest).to eq(new)
    end
  end
end
