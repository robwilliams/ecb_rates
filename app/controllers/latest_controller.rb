class LatestController < ApplicationController
  def index
    @rates = Rates.new Rate.new(currency: 'GBP')
    @rates.add Rate.new(currency: 'USD', rate: '1.5711')
    @rates.add Rate.new(currency: 'EUR', rate: '1.3211')

    if params[:base]
      @rates = @rates.rebase params[:base]
    end
  end
end
