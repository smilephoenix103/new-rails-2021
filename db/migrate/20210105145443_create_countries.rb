class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table : do |t|
      t.string :continent
      t.string :country_en
      t.string :country_pl
      t.string :capital_city
      t.string :alfa_2
      t.string :alfa_3
      t.string :numeric_code
      t.string :iso_code

      t.timestamps
    end
  end
end
