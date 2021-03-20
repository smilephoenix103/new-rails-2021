class BondFixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :bonds, :image_type, :img_type
  end
end
