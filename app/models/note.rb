class Note < ApplicationRecord
  belongs_to :currency

  validates :making, presence: true
  validates :status, presence: true
  validates :img_type, presence: true

  # validates :price_buy, format: { with: /\A([0-9]{1,4}|[0-9]{1,4}+[\.]?[0-9]{1,2})\z/, message: "Cena musi byc liczba" }
  validates :price_buy ,presence:true, numericality: {only_float: true}
  validates :price_sell ,presence:true, numericality: {only_float: true}

  validates :note_width ,numericality: {only_integer: true}, allow_blank: true
  validates :note_height ,numericality: {only_integer: true}, allow_blank: true

  def self.default_timezone
    :utc
  end

  def to_s
  	note
  end
  def to_s
  	currency
  end
end
