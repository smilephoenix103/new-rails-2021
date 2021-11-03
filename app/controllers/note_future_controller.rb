class NoteFutureController < ApplicationController
    before_action :set_role

    include NoteForSellHelper

    def index
        @countries = country_notes_status("FUTURE")
    end

    def show
        @notes = colection_notes_status(params[:id], "FUTURE")
    end

    def note_future_list
        @notes = Note.where("price_buy > 0 AND status = 'FUTURE'")
	    @note_future_list1 = @notes.sort_by {|note| [note.currency.country.country_en, note.denomination ] }

        @notes = Note.where("price_buy = 0 AND status = 'FUTURE'")
        @note_future_list2 = @notes.sort_by {|note| [note.currency.country.country_en, note.denomination ] }
    end

    def show_note_future
        puts "()()()()()()()()()()()()()()()"
        puts params[:id]
        @note = Note.find(params[:id])
        @country = @note.currency.country
        puts @note.inspect
    end

    private
    def set_role
        if (current_user == nil)
            redirect_to root_path
        elsif (current_user.role == 'admin' || current_user.role == 's_user')
            return true
        else
      return false
            redirect_to root_path, alert: "ERROR 404!!!"
        end
    end
end
