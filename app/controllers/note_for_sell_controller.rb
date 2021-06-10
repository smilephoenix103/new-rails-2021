class NoteForSellController < ApplicationController
	before_action :require_admin_logged_in!, only: [:note_for_sell_list]
	before_action :require_user_logged_in!

	include NoteForSellHelper

  def index
    # @countries = Country.find_by_sql("SELECT Distinct(country_en), cou.id FROM countries cou, currencies cur, notes note
 			# 				    	   WHERE cou.id = cur.country_id 
				# 			   			 AND cur.id = note.currency_id
				# 			   			 AND note.status = 'FOR SELL'
				# 			  		   ORDER BY country_en")


	@countries = country_notes_status("FOR SELL")
    	# Note.includes(:currency => :country).where(:currency => { :country_id => 72}).and(Note.where(status: 'SOLD')).each do |note|
    	
    	# Note.includes(:currency => :country).where(:currency => { :country_id => 72}, :status => 'SOLD').each do |note|
    	# 	puts note.status + note.making
    	# end
  end

  def show
    # @notes = Note.includes(:currency => :country).where(:currency => { :country_id => (params[:id])}, :status => 'FOR SELL')
    # @notes.each do |n|
    #   puts n.inspect

    @notes = colection_notes_status(params[:id], "FOR SELL")
  end

  def note_for_sell_list
	@note_for_sell_list = Note.where(:status => "FOR SELL")
  end
end
