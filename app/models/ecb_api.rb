class EcbApi

  EUROXREF_DAILY_URI='https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'

  def euroxref_daily
    HTTParty.get EUROXREF_DAILY_URI, headers: {"Content-Type" => 'text/xml'}
  rescue Timeout::Error => e
    raise EcbTimeoutError.new(e.message)
  end
end
