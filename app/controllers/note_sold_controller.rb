class NoteSoldController < ApplicationController
    before_action :require_admin_logged_in!

    include NoteForSellHelper

    def index
        @countries = country_notes_status("SOLD")
    end

    def show
        @notes = colection_notes_status(params[:id], "SOLD")
    end
end
