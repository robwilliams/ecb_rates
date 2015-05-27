class IncreasePrecisionOfAmount < ActiveRecord::Migration
  def up
    change_column :rates, :amount, :decimal, precision: 16, scale: 10, default: 0.0, null: false
  end

  def down
    change_column :rates, :amount, :decimal, precision: 10, scale: 8, default: 0.0, null: false
  end
end
