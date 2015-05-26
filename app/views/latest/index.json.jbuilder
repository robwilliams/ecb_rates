json.base @rates.base.currency
json.updated_at @rates.updated_at.iso8601

json.rates do
  @rates.each do |rate|
    json.set! rate.currency, rate.rate
  end
end
