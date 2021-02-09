class ChangeColumnInCountry < ActiveRecord::Migration[6.1]
   def change
    rename_column(:countries, :subsist, :exists)
  end
end
