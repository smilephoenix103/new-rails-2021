class NoteCollectionController < ApplicationController
include CountriesHelper
  def index
  	# @continent_countris = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: "FOR SELL"}}, :continent => 'Azja'}).order(country_en: :asc)
	# @continent_countris.each do |con|
	# 	puts con.country_en
	# end
	@continents_list = get_continent_list
	@continents_list.each do |c|
		puts c
	end
  end

  def show
  	puts "TESTTESTTESTETSTETSTETSTET"
  	puts params[:id]
  	# @continent_countris = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: "KOLEKCJA"}}, :continent => params[:id]}).order(country_en: :asc)
  	@countries = get_countries_with_continent(params[:id], "KOLEKCJA")
	# get_countries_with_continent(params[:id], "KOLEKCJA").each do |con|
	# 	puts con.country_en
	# end
	get_continent_list.each do |c|
		puts c
	end
  end
end
