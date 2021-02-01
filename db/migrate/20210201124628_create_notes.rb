class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.references :currency, null: false, foreign_key: true
      t.bigint :denomination
      t.string :name_currency
      t.string :note_date
      t.integer :signature_code
      t.float :price_buy
      t.float :price_sell
      t.integer :quantity
      t.string :quality
      t.string :status
      t.text :description
      t.string :img_type
      t.text :avers_path
      t.text :reverse_path

      t.timestamps
    end
  end
end
