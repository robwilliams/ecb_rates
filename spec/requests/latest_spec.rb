require 'rails_helper'

describe "Latest JSON", :type => :request do
  def do_request
    get "/latest.json"
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

    expect(json['rates']).to eq([
      'EUR' => {'rate' => '1.3211'},
      'USD' => {'rate' => '1.5711'},
      'GBP' => {'rate' => '1.0000'},
    ])
  end
end
