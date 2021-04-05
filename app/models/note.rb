class Note < ApplicationRecord
  belongs_to :currency

  validates :making, presence: true
  validates :status, presence: true
  validates :img_type, presence: true

  # validates :price_buy, format: { with: /\A([0-9]{1,4}|[0-9]{1,4}+[\.]?[0-9]{1,2})\z/, message: "Cena musi byc liczba" }
  validates :price_buy ,presence:true, numericality: {only_float: true}
    
  def to_s
  	note
  end
  def to_s
  	currency
  end
end
