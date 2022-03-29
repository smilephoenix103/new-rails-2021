class AddUnitQuantityToBonds < ActiveRecord::Migration[6.1]
  def change
    add_column :bonds, :unit_quantity, :string
    add_column :bonds, :unit_currency, :string
  end
end
