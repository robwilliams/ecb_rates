desc 'Fetches the latest feed from ECB'
task :update_daily_feed => :environment do
  UpdateDailyFeed.new.update
end
