require 'rails_helper'

describe "Latest JSON", :type => :request do

  let(:feed_updated_at) { Time.zone.now }

  before do
    daily_feed = Data::DailyFeed.create(feed_updated_at: feed_updated_at)
    daily_feed.rates.create(currency: 'GBP', amount: '1.1234567')
    daily_feed.rates.create(currency: 'USD', amount: '1.5711')
    daily_feed.rates.create(currency: 'EUR', amount: '1.0000')
  end

  def do_request(params='')
    get "/latest.json?#{params}"
  end

  def json
    JSON.parse(response.body)
  end

  it "is a successful response" do
    do_request

    expect(response.status).to eq(200)
  end

  it "contains the base rate" do
    do_request

    expect(json['base']).to eq 'EUR'
  end

  it "contains a list of rates" do
    do_request

    expect(json['rates']).to eq({
      'GBP' => '1.1234567',
      'USD' => '1.5711',
      'EUR' => '1.0',
    })
  end

  it "has an iso8601 updated_at timestamp" do
    do_request

    expect(json['updated_at']).to eq(feed_updated_at.iso8601)
  end

  it "allows list of rates to rebased into another currency" do
    do_request "base=USD"

    expect(json['rates']).to eq({
      'GBP' => '0.71508',
      'USD' => '1.0',
      'EUR' => '0.6365',
    })
  end
end
