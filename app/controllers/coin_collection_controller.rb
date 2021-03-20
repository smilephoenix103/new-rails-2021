class CoinCollectionController < ApplicationController
    before_action :require_user_logged_in!
    include CountriesHelper

    def index
        @countries = get_countries_coin_colection("KOLEKCJA")
        @countries.each do |c|
            puts c.country_en
        end
    end

    def show
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& TEST &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        @currencies  = Currency.joins(:coins).where(country_id: params[:id], pattern: 'COIN' ). group(:id)
    end

    def show_coins
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& SHOW COINS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @coins = Coin.where(currency_id: params[:id], status: 'KOLEKCJA').order(denomination: :asc).order(coin_date: :asc)
    end

    def show_details_coin
        puts "(((((((((((((((((((((((((((((((( SHOW DETAILS COINS ))))))))))))))))))))))))))))"
        puts params[:id]
        @coin = Coin.find(params[:id])
    end

end
