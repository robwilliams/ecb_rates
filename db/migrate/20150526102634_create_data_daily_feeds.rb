class CreateDataDailyFeeds < ActiveRecord::Migration
  def change
    create_table :daily_feeds do |t|
      t.datetime :feed_updated_at

      t.timestamps null: false
    end
  end
end
