class BondsController < ApplicationController
  before_action :set_bond, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  include CurrenciesHelper

  # GET /bonds or /bonds.json
  def index
    # @bonds = Bond.all
    @countries = countries_list
  end

  def bond_currencies
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ TEST Bond $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts params[:id]
    puts params[:pattern]
    @pattern = params[:pattern]
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ END TEST $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @country = Country.find(params[:id])
    @currencies = get_currencies_with_pattern(@country.id, "BOND")
  end

  def bond_show_currency
    puts "############# COIN_SHOW_CURRENCY#####################################"
    if (params[:country_id] != nil)        
      @currency = Currency.find(params[:country_id])
      # @collection = @currency.notes.select { |note| note.status == 'KOLEKCJA' }
      # @sale =  @currency.notes.select { |note| note.status == 'FOR SELL' }
      @collection = Bond.where(currency_id: params[:country_id])
      puts "SHOW TEST WALUTY dla Obligacji"
      puts params[:country_id]
      puts params[:id]
      puts "SHOW TEST"        
  else       
      puts "+++++++++++++++++++++++  +++++++++++++++++++++++++"
      puts params[:id]      
      @currency = Currency.find(params[:id])   
      @collection = Bond.where(currency_id: params[:id])   
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"  
  end
  end

  # GET /bonds/1 or /bonds/1.json
  def show
  end

  # GET /bonds/new
  def new
    @bond = Bond.new
    @bond.currency_id = params[:currency_id]
    puts "****************** test dodawania obligacji ********************************"
    puts params[:currency_id]
  end

  # GET /bonds/1/edit
  def edit
  end

  # POST /bonds or /bonds.json
  def create
    @bond = Bond.new(bond_params)

    respond_to do |format|
      if @bond.save
        format.html { redirect_to @bond, notice: "Bond was successfully created." }
        format.json { render :show, status: :created, location: @bond }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonds/1 or /bonds/1.json
  def update
    respond_to do |format|
      if @bond.update(bond_params)
        format.html { redirect_to @bond, notice: "Bond was successfully updated." }
        format.json { render :show, status: :ok, location: @bond }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonds/1 or /bonds/1.json
  def destroy
    @bond.destroy
    respond_to do |format|
      format.html { redirect_to bonds_url, notice: "Bond was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bond
      @bond = Bond.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bond_params
      params.require(:bond).permit(:currency_id, :date_buy, :series, :bought, :denomination, :name_currency, :bond_date, :signature_code, :price_buy, :price_sell, :quantity, :quality, :making, :status, :status_sell, :description, :img_type, :avers_path, :reverse_path)
    end
end
