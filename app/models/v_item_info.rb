class VItemInfo < ActiveRecord::Base
  self.primary_key = :id

  def readonly?
    true
  end

  def self.default_timezone
    :utc
  end
end
