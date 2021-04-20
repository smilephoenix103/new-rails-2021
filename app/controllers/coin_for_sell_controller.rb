class CoinForSellController < ApplicationController
    before_action :require_user_logged_in!
    include CoinForSellHelper

    def index
        puts "^^^^^^^^^^^^^^COIN FOR SELL^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        @countries = country_coins_status("FOR SELL")
    end

    def show
        @collection_for_sell = colection_coins_status(params[:id], "FOR SELL")
    end
end
