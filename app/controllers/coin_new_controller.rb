class CoinNewController < ApplicationController
  before_action :require_admin_logged_in!

  def index
    @countries = Country.includes(:currencies => :coins).where({ :currencies => { :coins => { status: "NEW"}}}).order(country_en: :asc)
    flash.now[:info] = "Liczba Państw do weryfikacji - " + @countries.size.to_s
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^TEST^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts @countries.size
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^END TEST^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  end

  def show
    puts params[:id]
    @coins = Coin.includes(:currency => :country).where(:currency => { :country_id => params[:id]}, :status => "NEW")

  end
end
