json.extract! coin, :id, :currency_id, :date_buy, :bought, :denomination, :name_currency, :coin_date, :series, :diameter, :thickness, :weight, :signature_code, :price_buy, :price_sell, :quantity, :quality, :status, :status_sell, :img_type, :composition, :description, :avers_path, :reverse_path, :created_at, :updated_at
json.url coin_url(coin, format: :json)
