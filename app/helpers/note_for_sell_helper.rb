module NoteForSellHelper
	def colection_notes_status(country_id, status)
		@notes = Note.includes(:currency => :country).where(:currency => { :country_id => country_id}, :status => status)
	end

	def colection_notes_status_visible(country_id, status, visible)
		@notes = Note.includes(:currency => :country).where(:currency => { :country_id => country_id}, :status => status, :visible => visible)
	end

	def colection_notes_status_asc(country_id, status)
		@notes = Note.includes(:currency => :country).where(:currency => { :country_id => country_id}, :status => status).order(note_date: :asc)
	end

	def country_notes_status(status)
		@countries = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: status}}}).order(country_en: :asc)
	end

	def country_notes_status_visible(status, visible)
		@countries = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: status, visible: visible}}}).order(country_en: :asc)
	end
end
