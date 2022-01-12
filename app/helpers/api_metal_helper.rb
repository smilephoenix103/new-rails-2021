module ApiMetalHelper
  def api_metal
    @api_metal_time_update = ApiMetalTimeUpdate.new
    @metals = Array.new
    # @response_code = response_code('https://api.metals.live/v1/spot')
    # puts URI.parse('https://api.metals.live/v1/spot').host

    uri = "https://api.metals.live/v1/spot"
    begin
      @response_code = response_code(uri)

      @response = RestClient.get(uri,{'Content-Type' => 'application/json'}) {|response, request, result| response }
    data = @response.body
    JSON.parse(data)
    result = JSON.parse(data)
    if result.size == 1
          puts result.keys[0].to_s
          puts result[result.keys[0].to_s]
          @api_metal_time_update.cod = result.keys[0].to_s
          @api_metal_time_update.message_code = result[result.keys[0].to_s]
    else
      @api_metal_time_update.cod = @response.code
      @api_metal_time_update.message_code = "OK"
    end
    rescue RestClient::ResourceNotFound => e
      puts "111111111111111111111111111111111111111111111111111111111111"
      puts e.class
      puts e

      rescue SocketError => e
      puts "222222222222222222222222222222222222222222222222222222222222"
      puts e.class
      puts e.to_s
      @api_metal_time_update.cod = e.class
      @api_metal_time_update.message_code = e
      # return @api_metal_time_update
      return true
    rescue Errno::ECONNREFUSED => e
      puts "333333333333333333333333333333333333333333333333333333333333"
      puts e.class
    rescue JSON::ParserError => e
      puts "444444444444444444444444444444444444444444444444444444444444"
      puts e.class
      puts e.inspect
    else
      if @api_metal_time_update.cod == 200
          data = @response.body
          result = JSON.parse(data)
            result.each do |r|
              if r.keys[0].to_s == "timestamp"
                # printf "| %-15s | %10s |\n" ,r.keys[0].to_s, DateTime.strptime(((r[r.keys[0]])/1000).to_s,'%s').strftime("%Y-%m-%d  %H:%M:%S")
                # printf "| %-15s | %25s |\n" ,r.keys[0].to_s, Time.at(((r[r.keys[0]])/1000))
                @api_metal_time_update.timestamp = r[r.keys[0]]
              else
                @metal = Metal.new
                @metal.name = r.keys[0].to_s
                @metal.price = r[(r.keys[0]).to_s]
                @metals.push(@metal)
              end
            end
          @api_metal_time_update.metals = @metals
        return @api_metal_time_update
        end
    end
  end

  def api_metal_console
    if (@api_metal_time_update.cod == 200) && (@api_metal_time_update != nil)
      puts" -------------------------------"
      printf "|\033[;46m         METAL PRICE           \033[0m|\n"
      printf "|\033[4;31m %-30s\033[0m| \n" , "  " + Time.at(((@api_metal_time_update.timestamp)/1000)).strftime("%Y-%m-%d  %H:%M:%S").to_s
      @api_metal_time_update.metals.each do |m|
        printf "|\033[4;33m %-14s \033[0m|\033[4;34m%12s$ \033[0m|\n" , m.name, m.price
      end
    else
      printf "|\033[4;31m %-10s %30s  \033[0m|\n", @api_metal_time_update.cod, @api_metal_time_update.message_code
    end
  end
end