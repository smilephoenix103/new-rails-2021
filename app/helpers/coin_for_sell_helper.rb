module CoinForSellHelper
    def country_coins_status(status)
		@countries = Country.includes(:currencies => :coins).where({ :currencies => { :coins => { status: status}}}).order(country_en: :asc)
	end

    def colection_coins_status(country_id, status)
		@coins = Coin.includes(:currency => :country).where(:currency => { :country_id => country_id}, :status => status)
	end
end
