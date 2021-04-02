class Note < ApplicationRecord
  belongs_to :currency

  validates :making, presence: true
  validates :status, presence: true
  validates_presence_of :img_type, presence: true

  def to_s
  	note
  end
  def to_s
  	currency
  end
end
