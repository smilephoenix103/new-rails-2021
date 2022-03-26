class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :pattern
      t.integer :quantity
      t.string :unit_quantity
      t.float :final_price
      t.text :description
      t.references :note, null: true, foreign_key: true
      t.references :coin, null: true, foreign_key: true
      t.references :bond, null: true, foreign_key: true

      t.timestamps
    end
  end
end
