class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_logged_in!

  include CurrenciesHelper
  include CountriesHelper

  # $country_search

  # GET /countries
  # GET /countries.json
  def index
    # @countries = Country.all.order(country_en: :asc)
    @countries = countries_list
    flash.now[:info] = @countries.size.to_s + " - Państw"
    @search = "country_search"
    @lang = extract_locale
    @country = Country.new
  end

  # GET /countries/1
  # GET /countries/1.json
  def show    
    @country = Country.find(@country.id)

    @currencies = get_currencies_with_pattern(@country.id, "NOTE")
  end

  # GET /countries/new
  def new
    @country = Country.new
    @continents = Continent.all.order(name_pl: :desc)
  end

  # GET /countries/1/edit
  def edit
  end

  def country_search
    begin
      @countries = search_country(params[:q])
      $country_search = @countries
      @search = "country_search"
      @lang = extract_locale
      # @countries = Country.where("country_en ILIKE '%" + params[:q] + "%' OR country_pl ILIKE '%" + params[:q] + "%'")
      # @countries = Country.where("country_en ILIKE ?","%" + params[:q] + "%")
      # flash.now[:info] = "Ilość państw: " + @countries.size.to_s

      # Country.where("country_en ILIKE '%kol%' OR country_pl ILIKE '%kol%'")
      # Country.where("country_en ILIKE '%" + params[:q] + "%' OR country_pl ILIKE '%" + params[:q] + "%'").each do |c|
      #   puts c.country_en + " - " + c.country_pl
      # end
      render :index
      
    rescue  
      @countries = $country_search
      @search = "country_search"
      @lang = extract_locale
      render :index
    end
  end 


  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:continent, :country_en, :country_pl, :capital_city, :alfa_2, :alfa_3, :numeric_code, :iso_code, :exists)
    end
end
