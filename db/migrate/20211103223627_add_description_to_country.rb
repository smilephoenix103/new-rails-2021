class AddDescriptionToCountry < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :description, :text
  end
end
