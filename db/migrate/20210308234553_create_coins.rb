class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.references :currency, null: false, foreign_key: true
      t.date :date_buy
      t.string :bought
      t.float :denomination
      t.string :name_currency
      t.string :coin_date
      t.string :series
      t.float :diameter
      t.float :thickness
      t.float :weight
      t.integer :signature_code
      t.float :price_buy
      t.float :price_sell
      t.integer :quantity
      t.string :quality
      t.string :status
      t.string :status_sell
      t.string :img_type
      t.text :composition
      t.text :description
      t.string :avers_path
      t.string :reverse_path

      t.timestamps
    end
  end
end
