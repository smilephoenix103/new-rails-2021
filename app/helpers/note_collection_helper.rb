module NoteCollectionHelper
	def notes_collections(currency_id, status)
		Note.where(currency_id: currency_id, status: status).order(denomination: :asc).order(note_date: :asc)
	end
end
