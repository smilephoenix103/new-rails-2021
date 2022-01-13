class ApiMetalTimeUpdate
  String @timestamp
  String @cod
  String @message_code
  metals = Array.new

  def initialize()
  end

  attr_reader :timestamp, :cod, :message_code, :metals
  attr_writer :timestamp, :cod, :message_code, :metals
end