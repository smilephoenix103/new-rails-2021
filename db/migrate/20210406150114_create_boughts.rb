class CreateBoughts < ActiveRecord::Migration[6.1]
  def change
    create_table :boughts do |t|
      t.string :name
      t.string :full_name
      t.text :description

      t.timestamps
    end
  end
end
