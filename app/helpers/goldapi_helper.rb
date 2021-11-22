module GoldapiHelper

  def goldapi_stat(key)
    response = RestClient.get("https://www.goldapi.io/api/stat",
                              {'x-access-token' => key}) {|response, request, result| response }
    # puts response.code
    # puts response.body
    # puts response.headers

    data = response.body
    # puts data
    result = JSON.parse(data)
    @stat_gold_api = StatGoldApi.new
    @stat_gold_api.today = result["requests_today"]
    @stat_gold_api.yesterday = result["requests_yesterday"]
    @stat_gold_api.this_month = result["requests_month"]
    @stat_gold_api.last_month = result["requests_last_month"]
    # puts @stat_gold_api.to_s
  end

  def goldapi_metal_rate(metal, currency, key)
    @rate_metal = RateMetal.new
    @error_gold_api = ErrorGoldApi.new

    begin
      @response = RestClient.get('https://www.goldapi.io/api/' + metal + '/' + currency + '/',
                                 {'x-access-token' => key,
                                  'Content-Type' => 'application/json'}) {|response, request, result| response }
      # puts @response.code
      # puts @response.class.name
      data = @response.body
      JSON.parse(data)
    rescue RestClient::ResourceNotFound => e
      puts "111111111111111111111111111111111111111111111111111111111111"
      puts e.class
    rescue SocketError => e
      puts "222222222222222222222222222222222222222222222222222222222222"
      puts e.class
      puts e.inspect
      @error_gold_api.code = 0
      @error_gold_api.error_message = e.class
      @rate_metal.error_gold_api = @error_gold_api
      return @rate_metal
    rescue Errno::ECONNREFUSED => e
      puts "333333333333333333333333333333333333333333333333333333333333"
      puts e.class
    rescue JSON::ParserError => e
      puts "444444444444444444444444444444444444444444444444444444444444"
      puts e.class
      puts e.inspect
      @error_gold_api.code = 859
      @error_gold_api.error_message = e.class
      @rate_metal.error_gold_api = @error_gold_api
      return @rate_metal
    else
      # puts @response.code
      # puts @response.class.name
      data = @response.body
      result = JSON.parse(data)

      if (@response.code == 200)
        @rate_metal.timestamp = result["timestamp"]
        @rate_metal.metal = result["metal"]
        @rate_metal.currency = result["currency"]
        @rate_metal.exchange = result['exchange']
        @rate_metal.symbol = result["symbol"]
        @rate_metal.prev_close_price = result["prev_close_price"]
        @rate_metal.open_price = result["open_price"]
        @rate_metal.low_price = result["low_price"]
        @rate_metal.high_price = result["high_price"]
        @rate_metal.open_time = result["open_time"]
        @rate_metal.price = result["price"]
        @rate_metal.ch = result["ch"]
        @rate_metal.ask = result["ask"]
        @rate_metal.bid = result["bid"]

        @error_gold_api.code = @response.code
        @rate_metal.error_gold_api = @error_gold_api
        return  @rate_metal
      else
        result = JSON.parse(data)
        @response.code
        # puts @response.body
        @rate_metal = RateMetal.new
        @error_gold_api.error_message = result["error"]
        @error_gold_api.code = @response.code
        @rate_metal.error_gold_api = @error_gold_api
        return @rate_metal
      end

      # puts @rate_metal.to_s
    end

  end

end
