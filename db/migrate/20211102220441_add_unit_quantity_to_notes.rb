class AddUnitQuantityToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :unit_quantity, :string
    add_column :notes, :unit_currency, :string
  end
end
