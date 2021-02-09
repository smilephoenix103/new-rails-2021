class Note < ApplicationRecord
  belongs_to :currency

  def to_s
  	note
  end
  def to_s
  	currency
  end
end
