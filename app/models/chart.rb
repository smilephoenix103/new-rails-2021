class Chart < ApplicationRecord

  validates :name, presence: true

  def to_s
    name.to_s
  end
end
