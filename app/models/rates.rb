class Rates
  include Enumerable

  attr_reader :base, :updated_at

  def initialize(base, updated_at: Time.zone.now)
    @base = base
    @rates = [base]
    @updated_at = updated_at
  end

  def add(rate)
    raise DuplicateCurrencyError if include?(rate)
    rates << rate
  end

  def each(&blk)
    rates.each(&blk)
  end

  def find_currency(currency)
    find {|rate| rate.currency == currency.upcase.to_sym }
  end

  def rebase(currency)
    new_base = Rate.new(currency: currency, rate: '1')
    rebase_rate = find_currency(currency)

    self.class.new(new_base).tap do |new_rates|
      rates.each do |rate|
        new_rates.add rate.rebase(rebase_rate)
      end
    end
  end

  private
  attr_reader :rates
end

class DuplicateCurrencyError < StandardError; end
