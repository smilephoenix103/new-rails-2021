class Time_update
  String @timestamp
  Integer @cod = 0
  metals = Array.new

  def initialize()
  end

  attr_reader :timestamp, :cod, :metals
  attr_writer :timestamp, :cod, :metals
end