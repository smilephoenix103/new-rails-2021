class NoteCollectionController < ApplicationController
before_action :require_user_logged_in!

include CountriesHelper
include NoteCollectionHelper
  def index
  	# @continent_countris = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: "FOR SELL"}}, :continent => 'Azja'}).order(country_en: :asc)
	# @continent_countris.each do |con|
	# 	puts con.country_en
	# end
	@continents = Continent.all
	@continents.each do |c|
		puts c
	end
  end

  def show
  	
  	@continent = Continent.find(params[:id])
  	puts @continent.file_name
  	# @continent_countris = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: "KOLEKCJA"}}, :continent => params[:id]}).order(country_en: :asc)
  	@countries = get_countries_with_continent(@continent.name_pl, "KOLEKCJA")
	puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^TEST^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	puts params[:id]
  end

  def back_to_country_note_collection
		@continent = Continent.where(name_pl: params[:continent])
		redirect_to note_collection_path(@continent.ids)
  end

  def show_currency
	puts "************************SHOW CURRENCY*****************************"
  	puts params[:id]
  	# @currencies = Currency.where(country_id: params[:id], pattern: 'NOTE')
	  @currencies  = Currency.joins(:notes).where(notes: {status: "KOLEKCJA"},country_id: params[:id], pattern: 'NOTE' ). group(:id).order(currency_series: :asc)
	  @country = @currencies[0].country
  end

  def show_note
  	puts params[:id]
  	@notes = notes_collections(params[:id], "KOLEKCJA")
	@country = @notes[0].currency.country
  end

  def back_show_currency
	puts "(((((((((((((((((TEST POWROTU USER IMAGE))))))))))))))))))))))"
	puts params[:id]
	@currency = Currency.find(params[:id])
	puts @currency.inspect
	puts"((((((((((((((((((((((((((( END )))))))))))))))))))))))))))"
	redirect_to show_currency_path(@currency.country_id)
  end



  def show_note_user
	puts "&&&&&&&&&&&&&& SHOW NOTE USER &&&&&&&&&&&&&&&&&&&"
	puts params[:id]
	@note = Note.find(params[:id])  
	@country = @note.currency.country
	puts "&&&&&&&&&&&&&& END &&&&&&&&&&&&&&&&&&&&&&&&&&"
  end
end
