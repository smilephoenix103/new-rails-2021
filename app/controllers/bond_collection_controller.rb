class BondCollectionController < ApplicationController
    # before_action :require_admin_logged_in!
    before_action :require_user_logged_in!
    include CountriesHelper

    def index
        @countries = get_countries_bond_colection("KOLEKCJA")
        @countries.each do |c|
            puts c.country_en
        end
    end

    def show
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& TEST &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        @currencies  = Currency.joins(:bonds).where(bonds: {status: "KOLEKCJA"},country_id: params[:id], pattern: 'BOND' ). group(:id)
        @country = @currencies[0].country
    end

    def show_bonds
        puts "&&&&&&&&&&&&&&&&&&&&&&&&& SHOW COINS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @bonds = Bond.where(currency_id: params[:id], status: 'KOLEKCJA').order(denomination: :asc).order(bond_date: :asc)
    end

    
    def back_show_currency_bond
        puts "(((((((((((((((((TEST POWROTU USER IMAGE To TU JESTEM))))))))))))))))))))))"
        puts params[:id]
        @currency = Currency.find(params[:id])
        puts @currency.inspect
        puts"((((((((((((((((((((((((((( END )))))))))))))))))))))))))))"
        redirect_to bond_collection_path(@currency.country.id)
    end

    def show_details_bond
        puts "(((((((((((((((((((((((((((((((( SHOW DETAILS BOND ))))))))))))))))))))))))))))"
        puts params[:id]
        @bond = BOND.find(params[:id])
    end

    def show_bond_user
        puts "&&&&&&&&&&&&&& SHOW bond USER &&&&&&&&&&&&&&&&&&&"
        puts params[:id]
        @bond = Bond.find(params[:id])  
        @country = @bond.currency.country
        puts "&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&&&&&&"
      end
end
