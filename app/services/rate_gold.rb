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
    puts" ------------------------------------------------------------"
    printf " | %-15s | %-10s | %0.3f \t\t | %0.4f\t|" ,@date, @price_for_gram, @price_for_ounce, @change


  end
end