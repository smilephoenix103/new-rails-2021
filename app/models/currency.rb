class Currency < ApplicationRecord
  belongs_to :country
  has_many :notes
end
