class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :note, optional: true
  belongs_to :coin, optional: true
  belongs_to :bond, optional: true
end
