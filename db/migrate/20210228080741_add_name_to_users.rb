class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :role, :string
  end
end
