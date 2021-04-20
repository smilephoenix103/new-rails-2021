class ChangeNoteColummnType < ActiveRecord::Migration[6.1]
  def change
    change_column :notes, :denomination, :float
  end
end
