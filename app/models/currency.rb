class Currency < ApplicationRecord
  belongs_to :country
  has_many :notes
  has_many :coins
  has_many :bonds

  def to_s
  	cod.to_s
  end
end
