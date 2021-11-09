class RateGold
  String @date
  Float @price_for_gram = 0.0
  Float @price_for_ounce = 0.0
  Float @change = 0.0
  def initialize()
  end

  attr_reader :date, :price_for_gram, :price_for_ounce, :change
  attr_writer :date, :price_for_gram, :price_for_ounce, :change

  def to_s
    printf " %-35s %-10s %-10s",@date, @price_for_gram, @price_for_ounce, @change
  end
end