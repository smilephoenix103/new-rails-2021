class HomeController < ApplicationController
  def index
  	@title = "test pecunia"

  	@data = "my_reports3"
  	# @dataChart = "bar"

  	@chart = Chart.all
    @report = Report.all
  	select_char
    select_report

  

  	# puts "!!!!!!!!!!TEST!!!!!!!!!!!!"
   #  puts params[:report_name]
  	# puts params[:chart_name]
  	# puts "!!!!!!!!!!TEST!!!!!!!!!!!!"

    @exchange_rate = ExchangeRate.new
    @exchange = @exchange_rate.rate
    puts @exchange.no

  	
  end

  def about
  end

  private
	  def select_char
	  	if (params[:chart_name] == nil || params[:chart_name] == "")
  		@dataChart = "bar"
  	else
  		@dataChart = params[:chart_name]
  		
  	end
	  end

    private
    def select_report
      if (params[:report_name] == nil || params[:report_name] == "")
       @data = "my_reports"
      # puts "*******************************TEST************************"
      # puts @data
      # puts "*******************************TEST************************"
    
    else
       @data = params[:report_name]
      puts "$$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
      # puts @data
      @report = Report.where(report: (params[:report_name]))
      puts @report
      @data_name = @report
      # puts @data_name
      puts "$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
    end
    end

    
end
