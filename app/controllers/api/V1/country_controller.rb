class Api::V1::CountryController < ApplicationController

    before_action :find_country, only: [:show]

  
    def index
        @countries = Country.where(continent: 'Europa')  
        render json: @countries
    end

    def show
        puts params[:id]
        # @countries = Country.where(continent: params[:id]) 
        
        @continent = Continent.new
        @continent.continent = @country.continent

        
        @country_dto = CountryDto.new
        @country_dto.counrty_en = @country.country_en
        @country_dto.capital_city = @country.capital_city

        @continent.country = @country_dto
        puts @continent.inspect

        puts @country_dto.inspect
        render json: @continent
    end


    private
    def find_country
        @country = Country.find(params[:id])
    end
end