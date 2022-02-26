class Coin < ApplicationRecord
  belongs_to :currency

  validates :status, presence: true
  validates :img_type, presence: true

  validates :diameter, numericality: {only_float: true}, allow_blank: true
  validates :thickness, numericality: {only_float: true}, allow_blank: true
  validates :weight, numericality: {only_float: true}, allow_blank: true
  # validates :price_buy, format: { with: /\A([0-9]{1,4}|[0-9]{1,4}+[\.]?[0-9]{1,2})\z/, message: "Cena musi byc liczba" }
  validates :price_buy ,presence:true, numericality: {only_float: true}
  validates :price_sell ,presence:true, numericality: {only_float: true}

  def self.default_timezone
    :utc
  end
    
end
