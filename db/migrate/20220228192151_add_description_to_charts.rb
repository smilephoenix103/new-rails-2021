class AddDescriptionToCharts < ActiveRecord::Migration[6.1]
  def change
    add_column :charts, :description, :text
  end
end
