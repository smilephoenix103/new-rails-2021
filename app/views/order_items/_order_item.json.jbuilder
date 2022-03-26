json.extract! order_item, :id, :order_id, :pattern, :quantity, :unit_quantity, :final_price, :description, :note_id, :coin_id, :bond_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
