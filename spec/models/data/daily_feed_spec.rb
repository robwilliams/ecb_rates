require 'rails_helper'

RSpec.describe Data::DailyFeed, type: :model do
  describe ".latest" do
    it "is the record with the most recently updated feed_updated_at column" do
      new = Data::DailyFeed.create(feed_updated_at: 1.hour.ago)
      old = Data::DailyFeed.create(feed_updated_at: 1.week.ago)

      expect(Data::DailyFeed.latest).to eq(new)
    end
  end
end
