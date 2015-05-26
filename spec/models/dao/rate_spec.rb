require 'rails_helper'

RSpec.describe Dao::Rate, type: :model do
  describe "#amount" do
    it "does not strip the first 8 significant digits when persisted" do
      num = "0.12345678"

      subject.amount = num
      subject.save
      subject.reload

      expect(subject.amount).to eq(BigDecimal.new(num))
    end
  end
end
