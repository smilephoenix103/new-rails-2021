class Api::CountryController < ApplicationController
    def index
        @countries = Country.where(continent: 'Europa')  
        render json: @countries
    end

    def show
        puts params[:id]
        @countries = Country.where(continent: params[:id])  
        render json: @countries
    end
end