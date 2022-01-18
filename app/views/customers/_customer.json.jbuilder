json.extract! customer, :id, :name, :lastname, :active, :city, :zip_code, :street, :number, :email, :nick, :phone, :description, :created_at, :updated_at
json.url customer_url(customer, format: :json)
