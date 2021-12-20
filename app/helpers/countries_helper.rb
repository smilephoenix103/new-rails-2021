module CountriesHelper
	def get_continent_list
		Country.select(:continent).distinct.order(continent: :asc)
	end

	def get_countries_with_continent(continent, status)
		Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: status}}, :continent => continent}).order(country_en: :asc)
	end

	def get_countries_with_continent_notes_visible(continent, status, visible)
		# Country.includes(:currencies => :notes).where({ :currencies => { :notes => ({status: status})&&({visible: visible})}, :continent => continent}).order(country_en: :asc)
		Country.includes(:currencies => :notes).where({ :currencies => { :notes => {status: status, visible: visible}}, :continent => continent}).order(country_en: :asc)
	end

	def get_countries_coin_colection(status)
		Country.includes(:currencies => :coins).where({ :currencies => { :coins => { status: status}}}).order(country_en: :asc)
	end

	def get_countries_bond_colection(status)
		Country.includes(:currencies => :bonds).where({ :currencies => { :bonds => { status: status}}}).order(country_en: :asc)
	end

	def search_country(country_name)
		# @countries = Country.where("country_en ILIKE ?","%" + country_name + "%")
		# @countries = Country.where("country_en ILIKE '%" + params[:q] + "%' OR country_pl ILIKE '%" + params[:q] + "%'")
		@countries = Country.where("country_en ILIKE '" + params[:q] + "%' OR country_pl ILIKE '" + params[:q] + "%'")

	end
end
