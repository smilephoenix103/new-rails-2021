class NoteNewController < ApplicationController
  before_action :require_admin_logged_in!

  include NoteForSellHelper

  def index
    @countries = country_notes_status("NEW")
    flash.now[:info] = "BANKNOTY DO WERYFIKACJI"
  end

  def show
    @notes = colection_notes_status(params[:id], "NEW")
  end
end
