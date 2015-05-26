class LatestController < ApplicationController
  def index
    @rates = DailyFeedMapper.new(Data::DailyFeed.latest).map

    if params[:base]
      @rates = @rates.rebase params[:base]
    end
  end
end
