json.extract! note, :id, :currency_id, :denomination, :name_currency, :note_date, :signature_code, :price_buy, :price_sell, :quantity, :quality, :status, :description, :img_type, :avers_path, :reverse_path, :created_at, :updated_at
json.url note_url(note, format: :json)
