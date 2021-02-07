class HomeController < ApplicationController
  def index
  	@title = "test pecunia"

  	@data = "my_reports3"
  	# @dataChart = "bar"

  	@chart = Chart.all

  	@chart.each do |c|
  		puts c.inspect
  	end
  	puts "!!!!!!!!!!TEST!!!!!!!!!!!!"
  	puts params[:chart_id]
  	puts "!!!!!!!!!!TEST!!!!!!!!!!!!"

  	if (params[:chart_id] != nil)
  		@dataChart = params[:chart_id]
  	else
  		@dataChart = "bar"
  	end
  end

  def about
  end
end
