class NoteForSellController < ApplicationController
	# before_action :require_admin_logged_in!, only: [:note_for_sell_list]
	before_action :require_user_logged_in!
	before_action :set_role, only: [:note_for_sell_list]

	include NoteForSellHelper

  def index
    # @countries = Country.find_by_sql("SELECT Distinct(country_en), cou.id FROM countries cou, currencies cur, notes note
 			# 				    	   WHERE cou.id = cur.country_id 
				# 			   			 AND cur.id = note.currency_id
				# 			   			 AND note.status = 'FOR SELL'
				# 			  		   ORDER BY country_en")

    if current_user.role == 'admin'
	    @countries = country_notes_status("FOR SELL")
    else
      @countries = country_notes_status_visible("FOR SELL", true)
    end
    	# Note.includes(:currency => :country).where(:currency => { :country_id => 72}).and(Note.where(status: 'SOLD')).each do |note|
    	
    	# Note.includes(:currency => :country).where(:currency => { :country_id => 72}, :status => 'SOLD').each do |note|
    	# 	puts note.status + note.making
    	# end
  end

  def show
    # @notes = Note.includes(:currency => :country).where(:currency => { :country_id => (params[:id])}, :status => 'FOR SELL')
    # @notes.each do |n|
    #   puts n.inspect

    if current_user.role == 'admin'
      @notes = colection_notes_status(params[:id], "FOR SELL")
    else
      @notes = colection_notes_status_visible(params[:id], "FOR SELL", true)
      if @notes.size == 0
        redirect_to root_path, alert: "ERROR 404!!!" + @notes.size.to_s
      end
    end
  end

  def note_for_sell_list
	@notes = Note.where(:status => "FOR SELL")
	@note_for_sell_list = @notes.sort_by {|note| [note.currency.country.country_en, note.denomination ] }
	
  end

  private
    def set_role
        if (current_user == nil)
            redirect_to root_path
        elsif (current_user.role == 'admin' || current_user.role == 's_user')
            return true
        else
            redirect_to root_path, alert: "ERROR 404!!!"
        end
    end
end
