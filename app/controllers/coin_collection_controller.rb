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
        puts params[:id]
        @currencies  = Currency.joins(:coins).where(coins: {status: "KOLEKCJA"},country_id: params[:id], pattern: 'COIN' ). group(:id)
        @country = @currencies[0].country
        @currencies.each do |c|
            puts c.inspect
        end
    end

    def show_coins
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& SHOW COINS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @coins = Coin.where(currency_id: params[:id], status: 'KOLEKCJA').order(denomination: :asc).order(coin_date: :asc)
        @country = @coins[0].currency.country
    end

    def back_show_currency_coin
        puts params[:id]        
        @currency = Currency.find(params[:id])
        puts @currency.inspect
        redirect_to coin_collection_path(@currency.country_id)
      end

    def show_details_coin
        puts "(((((((((((((((((((((((((((((((( SHOW DETAILS COINS ))))))))))))))))))))))))))))"
        puts params[:id]
        @coin = Coin.find(params[:id])
    end

    def show_coin_user
        puts "&&&&&&&&&&&&&& SHOW COIN USER &&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @coin = Coin.find(params[:id])  
        @country = @coin.currency.country
        puts "&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&&&&&&"
      end

end
