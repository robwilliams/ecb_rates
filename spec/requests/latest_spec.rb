require 'rails_helper'

describe "Latest JSON", :type => :request do
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

    expect(json['base']).to eq 'GBP'
  end

  it "contains a list of rates" do
    do_request

    expect(json['rates']).to eq({
      'EUR' => '1.3211',
      'USD' => '1.5711',
      'GBP' => '1.0',
    })
  end

  it "allow list of rates to rebased into another currency" do
    do_request "base=USD"

    expect(json['rates']).to eq({
      'EUR' => '0.84088',
      'USD' => '1.0',
      'GBP' => '0.6365',
    })
  end
end
