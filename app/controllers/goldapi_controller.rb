class GoldapiController < ApplicationController
  before_action :require_admin_logged_in!

  require 'json'
  require 'rest-client'
  include GoldapiHelper
  include HomeHelper

  def index
    @goldapi = Setting.find_by(name: "x-access-token")
    if @goldapi != nil
      @metal_code = Setting.find_by(name: "metals code")
      if @metal_code != nil
        metals = split_code(@metal_code.value)
        puts "############################## START #####################################"
        puts @metal_code.value
        puts "############################# KONIEC ###################################"
      else
        metals = %w(XAU)
      end
      @goldapi_metal_rates = Array.new
      metals.each do |m|
        @rate_metal = RateMetal.new
        @rate_metal = goldapi_metal_rate(m, "USD", @goldapi.value)
        @goldapi_metal_rates.push(@rate_metal)
      end
      goldapi_stat(@goldapi.value)

      puts "_______________________________________________________________________________"
      @goldapi_metal_rates.each do |g|
        puts g.inspect
      end
      puts "_________________________________________________________________________________"
    end
  end
end
