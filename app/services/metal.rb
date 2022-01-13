class Metal
  String @name
  Float @price = 0.0

  def initializa()
  end

  attr_reader :name, :price
  attr_writer :name, :price

  def to_s

  end
end