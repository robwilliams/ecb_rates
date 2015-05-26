require 'rails_helper'

describe EcbApi do
  describe '#eurofxref_daily' do
    context "with a successful response" do
      before do
        stub_request(:get, EcbApi::EUROXREF_DAILY_URI).
          to_return(body: File.new('spec/fixtures/eurofxref-daily.xml'), headers: {
          'Content-Type' => 'text/xml'
        })
      end

      it 'returns a parsed xml response' do
        response = subject.euroxref_daily

        expect(response.parsed_response).to eq(
          {"Envelope"=>
            {"subject"=>"Reference rates",
             "Sender"=>{"name"=>"European Central Bank"},
             "Cube"=>
              {"Cube"=>
                {"Cube"=>
                  [{"currency"=>"USD", "rate"=>"1.1133"},
                   {"currency"=>"JPY", "rate"=>"134.79"},
                   {"currency"=>"BGN", "rate"=>"1.9558"},
                   {"currency"=>"CZK", "rate"=>"27.351"},
                   {"currency"=>"DKK", "rate"=>"7.4577"},
                   {"currency"=>"GBP", "rate"=>"0.70990"},
                   {"currency"=>"HUF", "rate"=>"306.97"},
                   {"currency"=>"PLN", "rate"=>"4.0959"},
                   {"currency"=>"RON", "rate"=>"4.4490"},
                   {"currency"=>"SEK", "rate"=>"9.2613"},
                   {"currency"=>"CHF", "rate"=>"1.0394"},
                   {"currency"=>"NOK", "rate"=>"8.4330"},
                   {"currency"=>"HRK", "rate"=>"7.5398"},
                   {"currency"=>"RUB", "rate"=>"55.2685"},
                   {"currency"=>"TRY", "rate"=>"2.8611"},
                   {"currency"=>"AUD", "rate"=>"1.4112"},
                   {"currency"=>"BRL", "rate"=>"3.3530"},
                   {"currency"=>"CAD", "rate"=>"1.3600"},
                   {"currency"=>"CNY", "rate"=>"6.8980"},
                   {"currency"=>"HKD", "rate"=>"8.6322"},
                   {"currency"=>"IDR", "rate"=>"14620.12"},
                   {"currency"=>"ILS", "rate"=>"4.3031"},
                   {"currency"=>"INR", "rate"=>"70.8201"},
                   {"currency"=>"KRW", "rate"=>"1218.13"},
                   {"currency"=>"MXN", "rate"=>"16.8999"},
                   {"currency"=>"MYR", "rate"=>"4.0123"},
                   {"currency"=>"NZD", "rate"=>"1.5239"},
                   {"currency"=>"PHP", "rate"=>"49.433"},
                   {"currency"=>"SGD", "rate"=>"1.4875"},
                   {"currency"=>"THB", "rate"=>"37.203"},
                   {"currency"=>"ZAR", "rate"=>"13.1113"}],
                 "time"=>"2015-05-21"}}}}
        )
      end
    end
  end
end
