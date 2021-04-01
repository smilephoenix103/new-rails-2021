class Currency < ApplicationRecord
  belongs_to :country
  has_many :notes
  has_many :coins
  has_many :bonds

  validates :pattern, presence: true

  def to_s
  	cod.to_s
  end
end
