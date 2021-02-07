class HomeController < ApplicationController
  def index
  	@title = "test pecunia"

  	@data = "my_reports3"
  	# @dataChart = "bar"

  	@chart = Chart.all
  	select_char

  	# @chart.each do |c|
  	# 	puts c.inspect
  	# end
  	puts "!!!!!!!!!!TEST!!!!!!!!!!!!"
  	puts params[:chart_id]
  	puts "!!!!!!!!!!TEST!!!!!!!!!!!!"

  	
  end

  def about
  end

  private
	  def select_char
	  	if (params[:chart_id] != nil)
  		@dataChart = params[:chart_id]
  	else
  		@dataChart = "bar"
  	end
	  end
end
