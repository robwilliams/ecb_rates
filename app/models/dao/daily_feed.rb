class Dao::DailyFeed < ActiveRecord::Base
  has_many :rates

  def self.latest
    order(feed_updated_at: :desc).first
  end
end
