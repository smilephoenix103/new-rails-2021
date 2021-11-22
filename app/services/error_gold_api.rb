class ErrorGoldApi
  String @error_message
  Integer @code = 0

  # def initialize()
  # end

  attr_reader :error_message, :code
  attr_writer :error_message, :code

  def to_s
    printf " | %-10s - %-20s \n" , @error_code, @error
  end
end