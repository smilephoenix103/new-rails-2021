class BondCollectionController < ApplicationController
    before_action :require_admin_logged_in!
    include CountriesHelper

    def index
        @countries = get_countries_bond_colection("KOLEKCJA")
        @countries.each do |c|
            puts c.country_en
        end
    end

    def show
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& TEST &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        @currencies  = Currency.joins(:bonds).where(country_id: params[:id], pattern: 'BOND' ). group(:id)
    end

    def show_bonds
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& SHOW COINS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @bonds = Bond.where(currency_id: params[:id], status: 'KOLEKCJA').order(denomination: :asc).order(bond_date: :asc)
    end

    def show_details_bond
        puts "(((((((((((((((((((((((((((((((( SHOW DETAILS BOND ))))))))))))))))))))))))))))"
        puts params[:id]
        @bond = BOND.find(params[:id])
    end
end
