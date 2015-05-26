class Rate
  DEFAULT_RATE = BigDecimal.new("1.000").freeze

  def initialize(currency:, rate: DEFAULT_RATE)
    @currency = currency.upcase.to_sym
    @rate = BigDecimal.new(rate)
  end

  def rebase(base)
    self.class.new(currency: currency).tap do |new_rate|
      new_rate.rate = (rate / base.rate).round(5)
    end
  end

  attr_accessor :currency, :rate
end
