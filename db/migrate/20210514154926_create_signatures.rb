class CreateSignatures < ActiveRecord::Migration[6.1]
  def change
    create_table :signatures do |t|
      t.integer :signature_cod
      t.string :short_name
      t.text :description

      t.timestamps
    end
  end
end
