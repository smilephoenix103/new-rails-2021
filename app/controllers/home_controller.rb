class HomeController < ApplicationController
  include HomeHelper
  include ApiMetalHelper


  def index
    # api_metal
    # api_metal_console
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

    # _________________________TEST VIEW___________________________________________

    puts "+++++++++++++++++++++++++TEST VIEWS +++++++++++++++++++++++++++++++++++"

    @view = VItemInfo.all

    @view.each do |v|
      puts v.inspect
    end


    puts "+++++++++++++++++++++++++++++++END TEST++++++++++++++++++++++++++++++++++"

  end

  def about
    # api_metal
    # api_metal_console
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
