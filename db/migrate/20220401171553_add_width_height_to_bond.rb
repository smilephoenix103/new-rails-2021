class AddWidthHeightToBond < ActiveRecord::Migration[6.1]
  def change
    add_column :bonds, :width, :integer
    add_column :bonds, :height, :integer
  end
end
