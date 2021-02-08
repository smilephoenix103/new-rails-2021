class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :report
      t.string :string
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
