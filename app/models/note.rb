class Note < ApplicationRecord
  belongs_to :currency

  validates :making, presence: true
  validates :status, presence: true
  validates :img_type, presence: true

  def to_s
  	note
  end
  def to_s
  	currency
  end
end
