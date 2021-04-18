class Coin < ApplicationRecord
  belongs_to :currency

  validates :status, presence: true
  validates :img_type, presence: true

  validates :diameter ,presence:true, numericality: {only_float: true}
  validates :thickness  ,presence:true, numericality: {only_float: true}
  validates :weight ,presence:true, numericality: {only_float: true}
  # validates :price_buy, format: { with: /\A([0-9]{1,4}|[0-9]{1,4}+[\.]?[0-9]{1,2})\z/, message: "Cena musi byc liczba" }
  validates :price_buy ,presence:true, numericality: {only_float: true}
  validates :price_sell ,presence:true, numericality: {only_float: true}
    
end
