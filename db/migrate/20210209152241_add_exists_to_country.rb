class AddExistsToCountry < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :exists, :boolean
  end
end
