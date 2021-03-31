class CreatePatterns < ActiveRecord::Migration[6.1]
  def change
    create_table :patterns do |t|
      t.string :name_pl
      t.string :name_en
      t.text :description

      t.timestamps
    end
  end
end
