class CreateBonds < ActiveRecord::Migration[6.1]
  def change
    create_table :bonds do |t|
      t.references :currency, null: false, foreign_key: true
      t.date :date_buy
      t.string :series
      t.string :bought
      t.bigint :denomination
      t.string :name_currency
      t.string :bond_date
      t.integer :signature_code
      t.float :price_buy
      t.float :price_sell
      t.integer :quantity
      t.string :quality
      t.string :making
      t.string :status
      t.string :status_sell
      t.text :description
      t.string :image_type
      t.text :avers_path
      t.text :reverse_path

      t.timestamps
    end
  end
end
