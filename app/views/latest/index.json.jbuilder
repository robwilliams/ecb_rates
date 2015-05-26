json.base @rates.base.currency

json.rates do
  @rates.each do |rate|
    json.set! rate.currency, rate.rate
  end
end
