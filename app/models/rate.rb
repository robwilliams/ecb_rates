class Rate
  attr_accessor :currency, :rate

  DEFAULT_RATE = BigDecimal.new("1.000").freeze

  def initialize(currency:, rate: DEFAULT_RATE)
    @currency = currency.to_s.upcase.to_sym
    @rate = BigDecimal.new(rate)
  end

  def rebase(base)
    self.class.new(currency: currency).tap do |new_rate|
      new_rate.rate = (rate / base.rate).round(5)
    end
  end
end
