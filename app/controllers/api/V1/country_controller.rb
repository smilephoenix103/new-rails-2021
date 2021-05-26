class Api::V1::CountryController < ApplicationController

    # before_action :find_country, only: [:show]

  
    def index
        @countries = Country.where(continent: 'Europa')  
        render json: @countries
    end

    def show
        puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
        puts params[:id]
        @countries = Country.where(continent: params[:id]).order(country_en: :asc)
        
        @continent_dto = ContinentDto.new
        @continent_dto.continent = @countries[0].continent

        countries_dto = Array.new

        @countries.each do |c|
            @country_dto = CountryDto.new
            @country_dto.id = c.id
            @country_dto.counrty_en = c.country_en
            @country_dto.capital_city = c.capital_city        
            countries_dto.push(@country_dto)
        end
        @continent_dto.countries = countries_dto
        puts @continent_dto.inspect

        puts @country_dto.inspect
        render json: @continent_dto
    end


    private
    def find_country
        @country = Country.find(params[:id])
    end
end