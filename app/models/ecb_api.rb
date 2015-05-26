class EcbApi

  EUROXREF_DAILY_URI='https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'

  def euroxref_daily
    hash = HTTParty.get(EUROXREF_DAILY_URI, headers: {
      "Content-Type" => 'text/xml'
    }).parsed_response

    hash.fetch("Envelope").
         fetch("Cube").
         fetch("Cube").
         fetch("Cube")
  end
end
