class BoughtsController < ApplicationController
  before_action :set_bought, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  # GET /boughts or /boughts.json
  def index
    @boughts = Bought.all
    @bought = Bought.new
    puts "test edit"
    # @bought = Bought.find(params[:id])
    puts params[:id]
  end

  # GET /boughts/1 or /boughts/1.json
  def show
  end

  # GET /boughts/new
  def new
    @bought = Bought.new
  end

  # GET /boughts/1/edit
  def edit
    puts "test test tets tets"
    puts params[:id]
    @bought = Bought.find(params[:id])
    
  end

  # POST /boughts or /boughts.json
  def create
    @bought = Bought.new(bought_params)

    respond_to do |format|
      if @bought.save
        format.html { redirect_to @bought, notice: "Bought was successfully created." }
        format.json { render :show, status: :created, location: @bought }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boughts/1 or /boughts/1.json
  def update
    respond_to do |format|
      if @bought.update(bought_params)
        format.html { redirect_to @bought, notice: "Bought was successfully updated." }
        format.json { render :show, status: :ok, location: @bought }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boughts/1 or /boughts/1.json
  def destroy
    @bought.destroy
    respond_to do |format|
      format.html { redirect_to boughts_url, notice: "Bought was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bought
      @bought = Bought.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bought_params
      params.require(:bought).permit(:name, :full_name, :description)
    end
end
