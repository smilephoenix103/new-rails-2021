class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_logged_in!

  # require 'List_element'

  include CurrenciesHelper
  include CountriesHelper

  # GET /notes
  # GET /notes.json
  def index
    # @notes = Note.all
    @countries = countries_list
    @lang = extract_locale
    @search = "note_search"
  end

  def note_currencies
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ TEST NOTE $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts params[:id]
    puts params[:pattern]
    @pattern = params[:pattern]
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ END TEST $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @country = Country.find(params[:id])
    @currencies = get_currencies_with_pattern(@country.id, "NOTE")
  end

  def note_show_currency

    puts "(((((((((((((((((((((TEST NOTE TEST ))))))))))))))))))))))))))))"
    puts params[:id]
    puts params[:country_id]
    puts "(((((((((((((((((((((((((END TEST END)))))))))))))))))))))))"


    puts "############# Note_SHOW_CURRENCY#####################################"
    if (params[:country_id] != nil)        
      @currency = Currency.find(params[:country_id])
      # @collection = @currency.notes.select { |note| note.status == 'KOLEKCJA' }
      # @sale =  @currency.notes.select { |note| note.status == 'FOR SELL' }
      @collection = Note.where(currency_id: params[:country_id]).order(denomination: :asc)
      puts "SHOW TEST WALUTY"
      puts params[:country_id]
      puts params[:id]
      puts "SHOW TEST"        
  else       
      puts "+++++++++++++++++++++++ WALUTY +++++++++++++++++++++++++"
      puts params[:id]      
      @currency = Currency.find(params[:id])   
      @collection = Note.where(currency_id: params[:id]).order(denomination: :asc)   
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"  
  end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    # @notes = Note.find(params[:currency_id])
    # puts "!!!!!!!!!!!!!!!!!TEST!!!!!!!!!!!!!!!!!!"
    # puts @notes
    # puts "!!!!!!!!!!!!!!!!!!TEST!!!!!!!!!!!!!!!!!!!!"
     if (params[:currency_id] != nil)
        
        @note = Note.find(params[:currency_id])
        puts "SHOW TEST"
        puts params[:currency_id]
        puts "SHOW TEST"        
    else       
        puts "++++++++++++++++++++++++++++++++++++++++++++++++!!!!!!!!!!!!!"
        puts params[:id]      
        @note = Note.find(params[:id])  
        puts @note.currency.country.country_en
        @country = @note.currency.country
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++!!!!!!!!!!!!!!"  
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.price_buy = 0.0
    @note.price_sell = 0.0
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"
    puts params[:currency_id]
    @note.currency_id = params[:currency_id]

    puts @note.currency.country.id
    # @currencies = Currency.where(country_id: @note.currency.country.id, pattern: "NOTE").order(currency_series: :asc)
    @currencies = currency_series(@note, "NOTE")
    puts @currencies.inspect
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"

    @boughts = Bought.all
    @statuses = ElementSelect.statuses
    @makings = ElementSelect.makings
    @img_types = ElementSelect.img_types

    @country = @note.currency.country
  end

  def note_search
    begin
      @countries = search_country(params[:q])
      $country_search = @countries
      @lang = extract_locale
      @search = "note_search"
      # @countries = Country.where("country_en ILIKE ?","%" + params[:q] + "%")
      render :index
    rescue
      @countries = $country_search
      @lang = extract_locale
      @search = "note_search"
      render :index
    end
  end 

  # GET /notes/1/edit
  def edit
    # @currencies = Currency.where(country_id: @note.currency.country.id, pattern: "NOTE").order(currency_series: :asc)
    @currencies = currency_series(@note, "NOTE")

    @statuses = ElementSelect.statuses
    @makings = ElementSelect.makings
    @img_types = ElementSelect.img_types

    @country = @note.currency.country
    curr = currency_series(@note, "NOTE")
    curr.each do |c|
      puts c.currency_series
    end
  end

  # POST /notes
  # POST /notes.json
  def create    
    @note = Note.new(note_params)
    @currencies = currency_series(@note, "NOTE")
    puts @note.inspect
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!((((((((((((((((())))))))))))))))))))))))!!!!!!!!!!!!!!!!!!!!!!!!!"

    respond_to do |format|
      if @note.save
        @currency = Currency.find(@note.currency_id)
        format.html { redirect_to note_show_currency_path(@currency), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        @statuses = ElementSelect.statuses
        @makings = ElementSelect.makings
        @img_types = ElementSelect.img_types
        @country = @note.currency.country
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!(((((((((((((((((STATU UPDATE))))))))))))))))))))))))!!!!!!!!!!!!!!!!!!!!!!!!!"
    @currencies = currency_series(@note, "NOTE")
    puts @currencies.inspect
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!(((((((((((((((((END UPDATE))))))))))))))))))))))))!!!!!!!!!!!!!!!!!!!!!!!!!"
    respond_to do |format|
      if @note.update(note_params)
        @currency = Currency.find(@note.currency_id)
        format.html { redirect_to note_show_currency_path(@currency), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        @statuses = ElementSelect.statuses
        @makings = ElementSelect.makings
        @img_types = ElementSelect.img_types
        @country = @note.currency.country
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @currency = Currency.find(@note.currency_id)
    @note.destroy

    respond_to do |format|
      format.html { redirect_to @currency, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
        @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:currency_id, :denomination, :name_currency, :note_date, :signature_code, :price_buy, :price_sell, :quantity, :quality, :status, :description, :img_type, :avers_path, :reverse_path, :series, :making, :date_buy_note, :bought, :status_sell)
    end
end
