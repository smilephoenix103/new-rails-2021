class AddVisibleToNoteCoinBond < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :visible, :boolean
    add_column :coins, :visible, :boolean
    add_column :bonds, :visible, :boolean
  end
end
