class CoinsController < ApplicationController
  before_action :set_coin, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  include CurrenciesHelper
  include CountriesHelper

  # GET /coins or /coins.json
  def index
    # @coins = Coin.all
    @countries = countries_list
    @lang = extract_locale
    @search = "coin_search"
  end

  def coin_currencies
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ TEST COIN $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts params[:id]
    puts params[:pattern]
    @pattern = params[:pattern]
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ END TEST $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @country = Country.find(params[:id])
    @currencies = get_currencies_with_pattern(@country.id, "COIN")
    puts @currencies.size
    if (@currencies.size == 0)
      @pattern = "COIN"
    else (params[:pattern] != "")
      puts @currencies[0].pattern 
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++s"
      puts params[:pattern].to_s
      @pattern = @currencies[0].pattern 
    end
    puts "++++++++++++++++++++++++ po tescie+++++++++++++++++++++++++++++++++++++"
  end

  def coin_show_currency
    puts "############# COIN_SHOW_CURRENCY#####################################"
    if (params[:country_id] != nil)        
      @currency = Currency.find(params[:country_id])
      # @collection = @currency.notes.select { |note| note.status == 'KOLEKCJA' }
      # @sale =  @currency.notes.select { |note| note.status == 'FOR SELL' }
      @collection = Coin.where(currency_id: params[:country_id])
      puts "SHOW TEST WALUTY"
      puts params[:country_id]
      puts params[:id]
      puts "SHOW TEST"        
  else       
      puts "+++++++++++++++++++++++ WALUTY +++++++++++++++++++++++++"
      puts params[:id]      
      @currency = Currency.find(params[:id])   
      @collection = Coin.where(currency_id: params[:id])   
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"  
  end
  end

  # GET /coins/1 or /coins/1.json
  def show
    @country = @coin.currency.country
  end

  # GET /coins/new
  def new
    @coin = Coin.new
    @coin.price_buy = 0.0
    @coin.price_sell = 0.0
    @coin.diameter = 0.0
    @coin.thickness = 0.0
    @coin.weight = 0.0

    puts "****************** test dodawania monety ********************************"
    puts params[:currency_id]
    @coin.currency_id = params[:currency_id]

    @currencies = currency_series(@coin, "COIN")

    @boughts = Bought.all
    @statuses = ElementSelect.statuses
    @img_types = ElementSelect.img_types
    @country = @coin.currency.country
  end

  def coin_search
    begin
      @countries = search_country(params[:q])
      # @countries = Country.where("country_en ILIKE ?","%" + params[:q] + "%")
      $country_search = @countries
      @lang = extract_locale
      @search = "coin_search"
      render :index
    rescue
      @countries = $country_search
      @lang = extract_locale
      @search = "coin_search"
      render :index
    end
  end 

  # GET /coins/1/edit
  def edit
    @currencies = currency_series(@coin, "COIN")

    @statuses = ElementSelect.statuses
    @img_types = ElementSelect.img_types
    @country = @coin.currency.country
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)
    @currencies = currency_series(@coin, "COIN")
    @statuses = ElementSelect.statuses
    @img_types = ElementSelect.img_types
    @country = @coin.currency.country
    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    @statuses = ElementSelect.statuses
    @img_types = ElementSelect.img_types
    @country = @coin.currency.country
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: "Coin was successfully updated." }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  def destroy
    @coin.destroy
    respond_to do |format|
      format.html { redirect_to coins_url, notice: "Coin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:currency_id, :date_buy, :bought, :denomination, :name_currency, :coin_date, :series, :diameter, :thickness, :weight, :signature_code, :price_buy, :price_sell, :quantity, :quality, :status, :status_sell, :img_type, :composition, :description, :avers_path, :reverse_path)
    end
end
