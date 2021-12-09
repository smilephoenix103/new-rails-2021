class AddUnitQuantityToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :unit_quantity, :string
    add_column :coins, :unit_currency, :string
  end
end
