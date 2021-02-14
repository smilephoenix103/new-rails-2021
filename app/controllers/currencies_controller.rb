class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :edit, :update, :destroy]

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.all
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
   
    if (params[:country_id] != nil)
        
        @currency = Currency.find(params[:country_id])
        @collection = @currency.notes.select { |note| note.status == 'KOLEKCJA' }
        @sale =  @currency.notes.select { |note| note.status == 'FOR SELL' }
        puts "SHOW TEST"
        puts params[:country_id]
        puts "SHOW TEST"        
    else       
        puts "++++++++++++++++++++++++++++++++++++++++++++++++"
        puts params[:id]      
        @currency = Currency.find(params[:id])      
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++"  
    end
    @notes = Note.where("status = 'KOLEKCJA'")
    puts @notes.inspect
  end

  # GET /currencies/new
  def new
    @currency = Currency.new
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"
    puts params[:country_id]
    @currency.country_id = params[:country_id]
    # puts @currency.inspect
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"

  end

  # GET /currencies/1/edit
  def edit
  end

  # POST /currencies
  # POST /currencies.json
  def create
    # @country = Country.find(params[:country_id])
    # @currency = @country.currencies.create(curency_params)
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        @country = @currency.country
        format.html { redirect_to @country, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currencies/1
  # PATCH/PUT /currencies/1.json
  def update
    respond_to do |format|
      if @currency.update(currency_params)
         @country = @currency.country
        format.html { redirect_to @country, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @country = @currency.country
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to @country, notice: 'Currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.require(:currency).permit(:country_id, :cod, :currency, :change, :active, :data_exchange, :currency_from, :converter, :description, :pattern)
    end
end
