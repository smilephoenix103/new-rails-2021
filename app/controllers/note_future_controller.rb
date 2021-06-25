class NoteFutureController < ApplicationController
    before_action :set_role

    include NoteForSellHelper

    def index
        @countries = country_notes_status("FUTURE")
    end

    def show
        @notes = colection_notes_status(params[:id], "FUTURE")
    end

    private
    def set_role
        if (current_user == nil)
            redirect_to root_path
        elsif (current_user.role == 'admin' || current_user.role == 's_user')
            return true
        else
            redirect_to root_path
        end
    end
end
