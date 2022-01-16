class CoinCollectionController < ApplicationController
    before_action :require_user_logged_in!
    include CountriesHelper

    def index
        if current_user.role == 'admin'
            @countries = get_countries_coin_colection("KOLEKCJA")
        else
            @countries = get_countries_coin_visible_colection("KOLEKCJA", true)
        end

        @countries.each do |c|
            puts c.country_en
        end
    end

    def show
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& TEST &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        if current_user.role == 'admin'
            @currencies  = Currency.joins(:coins).where(coins: {status: "KOLEKCJA"},country_id: params[:id], pattern: 'COIN' ).group(:id).order(currency_series: :asc)
        else
            @currencies  = Currency.joins(:coins).where(coins: {status: "KOLEKCJA", visible: true},country_id: params[:id], pattern: 'COIN' ).group(:id).order(currency_series: :asc)
        end

        if @currencies.length != 0
            puts "888888888888888888888888888888888888888888888888"
            puts @currencies.length
            # puts @currencies.inspect
            @country = @currencies[0].country
        else
            redirect_to root_path, alert: "ERROR 404!!!"
        end

    end

    def show_coins
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& SHOW COINS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        if current_user.role == 'admin'
            @coins = Coin.where(currency_id: params[:id], status: 'KOLEKCJA').order(denomination: :asc).order(coin_date: :asc)
        else
            @coins = Coin.where(currency_id: params[:id], status: 'KOLEKCJA', visible: true).order(denomination: :asc).order(coin_date: :asc)
        end
        puts "0000000000000000000000000000000000000000000000000000000000000000000000000000"
        if @coins.size != 0
            puts @coins.size
            @country = @coins[0].currency.country
        else
            redirect_to root_path, alert: "ERROR 404!!!"
        end
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
        # @country = @coin.currency.country
        if @coin != nil && current_user.role == 'admin'
            @country = @coin.currency.country
        elsif @coin == nil || @coin.status != 'KOLEKCJA' || @coin.visible == false
            redirect_to root_path, alert: "ERROR 404!?!?! \n (" + params[:id].to_s + ")"
        else
            @country = @coin.currency.country
        end
        puts "&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&&&&&&"
      end

end
