class AddDimensionsToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :note_width, :integer
    add_column :notes, :note_height, :integer
  end
end
