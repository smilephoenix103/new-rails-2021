module NoteForSellHelper
	def colection_notes_status(country_id, status)
		@notes = Note.includes(:currency => :country).where(:currency => { :country_id => country_id}, :status => status)
	end

	def country_notes_status(status)
		@countries = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: status}}}).order(country_en: :asc)
	end
end
