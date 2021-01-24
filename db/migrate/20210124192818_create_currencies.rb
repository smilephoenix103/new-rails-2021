class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.references :country, null: false, foreign_key: true
      t.string :cod
      t.string :currency
      t.string :change
      t.integer :active
      t.string :data_exchange
      t.string :currency_from
      t.string :converter
      t.text :description

      t.timestamps
    end
  end
end
