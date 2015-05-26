class CreateDataRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :currency, default: ''
      t.decimal :amount, precision: 8, scale: 6, default: 0.0, null: false
      t.references :daily_feed, index: true

      t.timestamps null: false
    end

    add_foreign_key :daily_feeds, :rates, on_delete: :cascade
  end
end
