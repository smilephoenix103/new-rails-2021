class RateMetal
  String @timestamp
  String @metal
  String @currency
  String @exchange
  String @symbol
  Float @prev_close_price = 0.0
  Float @open_price = 0.0
  Float @low_price = 0.0
  Float @high_price = 0.0
  String @open_time
  Float @price = 0.0
  Float @ch = 0.0
  Float @ask = 0.0
  Float @bid = 0.0

  @error_gold_api = ErrorGoldApi.new

  def initialize()
  end

  attr_reader :timestamp, :metal, :currency, :exchange, :symbol, :prev_close_price, :open_price, :low_price, :high_price, :open_time, :price, :ch, :ask, :bid, :error, :error_gold_api
  attr_writer :timestamp, :metal, :currency, :exchange, :symbol, :prev_close_price, :open_price, :low_price, :high_price, :open_time, :price, :ch, :ask, :bid, :error, :error_gold_api

  def to_s
    puts" ------------------------------------------------------------"
    printf " | %-20s | %-10s \n" ,"Time:", DateTime.strptime(@timestamp.to_s,'%s').strftime("%Y-%m-%d  %H:%M:%S")
    printf " | %-20s | %-10s \n" ,"metal:", @metal
    printf " | %-20s | %-10s \n" ,"currency:", @currency
    printf " | %-20s | %-10s \n" ,"exchange:", @exchange
    printf " | %-20s | %-10s \n" ,"symbol:", @symbol
    printf " | %-20s | %-10s \n" ,"prev_close_price:", @prev_close_price
    printf " | %-20s | %-10s \n" ,"open_price:", @open_price
    printf " | %-20s | %-10s \n" ,"low price:", @low_price
    printf " | %-20s | %-10s \n" ,"high price:", @high_price
    printf " | %-20s | %-10s \n" ,"Open Time:", DateTime.strptime(@open_time.to_s,'%s').strftime("%Y-%m-%d  %H:%M:%S")
    printf " | %-20s | %-10s \n" ,"Price:", @price
    printf " | %-20s | %-10s \n" ,"Ch:", @ch
    printf " | %-20s | %-10s \n" ,"Ask:", @ask
    printf " | %-20s | %-10s \n" ,"Bid:", @bid
    puts error_gold_api.to_s
  end
end