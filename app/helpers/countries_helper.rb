module CountriesHelper
	def get_continent_list
		Country.select(:continent).distinct.order(continent: :asc)
	end

	def get_countries_with_continent(continent, status)
		Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: status}}, :continent => continent}).order(country_en: :asc)
	end

	
end
