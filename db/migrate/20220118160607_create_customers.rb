class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.boolean :active
      t.string :city
      t.string :zip_code
      t.string :street
      t.string :number
      t.string :email
      t.string :nick
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
