json.extract! order, :id, :customer_id, :order_number, :order_date, :order_date_send, :order_status, :tracking_number, :shipment_type, :shipment_cost, :description, :created_at, :updated_at
json.url order_url(order, format: :json)
