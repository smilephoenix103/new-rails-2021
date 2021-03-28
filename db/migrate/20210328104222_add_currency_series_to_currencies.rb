class AddCurrencySeriesToCurrencies < ActiveRecord::Migration[6.1]
  def change
    add_column :currencies, :currency_series, :string
  end
end
