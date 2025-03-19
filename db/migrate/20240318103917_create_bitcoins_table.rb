class CreateBitcoinsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bitcoins do |t|
      t.decimal :price, precision: 20, scale: 8, null: false
      t.datetime :timestamp, null: false

      t.timestamps
    end
  end
end
