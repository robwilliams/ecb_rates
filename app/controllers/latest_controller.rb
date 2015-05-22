class LatestController < ApplicationController
  def index
    render json: {
      base: 'GBP',
      rates: [
        'EUR' => {rate: '1.3211'},
        'USD' => {rate: '1.5711'},
      ]
    }
  end
end
