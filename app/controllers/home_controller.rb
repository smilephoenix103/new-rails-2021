class HomeController < ApplicationController
  include HomeHelper
  def index
  	# @title = "test pecunia"

  	# @data = "my_reports3"
  	# # @dataChart = "bar"

  	# @chart = Chart.all
    # @report = Report.all
  	# select_char
    # select_report

  

  	# puts "!!!!!!!!!!TEST!!!!!!!!!!!!"
   #  puts params[:report_name]
  	# puts params[:chart_name]
  	# puts "!!!!!!!!!!TEST!!!!!!!!!!!!"   
  
    @exchange_rate = ExchangeRate.new
    url = 'https://api.nbp.pl/api/exchangerates/tables/a/?format=json'
    @response_code = response_code(url)
    if (@response_code == "200")
      @exchange = @exchange_rate.rate(url)
    else
      @response_code
    end

    # RATE GOLD
    puts "\n\n $$$$$$$$$$$$$$$$$$$$$ RATE GOLD $$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    url_gold = 'http://api.nbp.pl/api/cenyzlota/last/11/?format=json'
    @response_code_gold = response_code(url_gold)
    @rate_gold = @exchange_rate.rate_gold(url_gold)

    # ------------------ TEST CURRENCY COD pobieranei z bazy -----------------------------


  end

  def about
    puts "******************************TEST*********************************"
    @response = RestClient.get('https://api.metals.live/v1/spot',
                               {'Content-Type' => 'application/json'}) {|response, request, result| response }
    # puts @response.code
    # puts @response.class.name
    data = @response.body
    result = JSON.parse(data)
    puts JSON.parse(data)
    @key = result[1].keys[0]
    puts @key.to_s
    puts @key.length
    puts result[1][@key]
  end

  # private
	#   def select_char
	#   	if (params[:chart_name] == nil || params[:chart_name] == "")
  # 		@dataChart = "bar"
  # 	else
  # 		@dataChart = params[:chart_name]
  		
  # 	end
	#   end

  #   private
  #   def select_report
  #     if (params[:report_name] == nil || params[:report_name] == "")
  #      @data = "my_reports"
  #     # puts "*******************************TEST************************"
  #     # puts @data
  #     # puts "*******************************TEST************************"
    
  #   else
  #      @data = params[:report_name]
  #     puts "$$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
  #     # puts @data
  #     @report = Report.where(report: (params[:report_name]))
  #     puts @report
  #     @data_name = @report
  #     # puts @data_name
  #     puts "$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
  #   end
  #   end

    
end
