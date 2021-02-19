class CreateContinents < ActiveRecord::Migration[6.1]
  def change
    create_table :continents do |t|
      t.string :name_pl
      t.string :name_en
      t.string :file_name

      t.timestamps
    end
  end
end
