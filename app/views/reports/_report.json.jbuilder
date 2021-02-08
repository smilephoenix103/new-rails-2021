json.extract! report, :id, :report, :string, :name, :description, :created_at, :updated_at
json.url report_url(report, format: :json)
