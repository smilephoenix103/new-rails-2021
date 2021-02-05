class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    # @notes = Note.find(params[:currency_id])
    # puts "!!!!!!!!!!!!!!!!!TEST!!!!!!!!!!!!!!!!!!"
    # puts @notes
    # puts "!!!!!!!!!!!!!!!!!!TEST!!!!!!!!!!!!!!!!!!!!"
     if (params[:currency_id] != nil)
        
        @note = Note.find(params[:currency_id])
        puts "SHOW TEST"
        puts params[:currency_id]
        puts "SHOW TEST"        
    else       
        puts "++++++++++++++++++++++++++++++++++++++++++++++++"
        puts params[:id]      
        @note = Note.find(params[:id])      
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++"  
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"
    puts params[:currency_id]
    @note.currency_id = params[:currency_id]
    puts "@@@@@@@@@@@@@TEST@@@@@@@@@@@@@@@@@"
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    puts @note.inspect

    respond_to do |format|
      if @note.save
        @currency = Currency.find(@note.currency_id)
        format.html { redirect_to @currency, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        @currency = Currency.find(@note.currency_id)
        format.html { redirect_to @currency, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @currency = Currency.find(@note.currency_id)
    @note.destroy

    respond_to do |format|
      format.html { redirect_to @currency, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:currency_id, :denomination, :name_currency, :note_date, :signature_code, :price_buy, :price_sell, :quantity, :quality, :status, :description, :img_type, :avers_path, :reverse_path)
    end
end