class GoldapiController < ApplicationController
  before_action :require_admin_logged_in!

  require 'json'
  require 'rest-client'
  include GoldapiHelper

  def index
    @goldapi = Setting.find_by(name: "x-access-token")
    if @goldapi != nil
      metals = %w(XAU XAG XPT)
      @goldapi_metal_rates = Array.new
      metals.each do |m|
        @rate_metal = RateMetal.new
        @rate_metal = goldapi_metal_rate(m, "USD", @goldapi.value)
        @goldapi_metal_rates.push(@rate_metal)
      end
      goldapi_stat(@goldapi.value)
    end
  end
end
