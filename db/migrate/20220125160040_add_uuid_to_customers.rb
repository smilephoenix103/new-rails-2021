class AddUuidToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :uuid, :string
  end
end
