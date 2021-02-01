class AddSeriesAndMakingAndDateBuyNoteAndBoughtAndStatusSellToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :series, :string
    add_column :notes, :making, :string
    add_column :notes, :date_buy_note, :date
    add_column :notes, :bought, :string
    add_column :notes, :status_sell, :string
  end
end
