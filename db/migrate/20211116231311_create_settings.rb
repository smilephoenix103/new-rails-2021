class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :web
      t.string :name
      t.string :value
      t.text :description

      t.timestamps
    end
  end
end
