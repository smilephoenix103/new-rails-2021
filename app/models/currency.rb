class Currency < ApplicationRecord
  belongs_to :country
  has_many :note
end
