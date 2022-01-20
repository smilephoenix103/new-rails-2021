class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :order_number
      t.date :order_date
      t.date :order_date_send
      t.string :order_status
      t.string :tracking_number
      t.string :shipment_type
      t.float :shipment_cost
      t.text :description

      t.timestamps
    end
  end
end
