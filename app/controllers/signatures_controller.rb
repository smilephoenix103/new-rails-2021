class SignaturesController < ApplicationController
  before_action :set_signature, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!, only: [:index]
  before_action :require_admin_logged_in!, only: [:show, :new, :edit, :update, :destroy]

  # GET /signatures or /signatures.json
  def index
    @signatures = Signature.all.order(signature_cod: :asc)
    @signature = Signature.new
  end

  # GET /signatures/1 or /signatures/1.json
  def show
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures or /signatures.json
  def create
    @signature = Signature.new(signature_params)

    respond_to do |format|
      if @signature.save
        format.html { redirect_to @signature, notice: "Signature was successfully created." }
        format.json { render :show, status: :created, location: @signature }
      else
        format.html { render :index, status: :unprocessable_entity }
        # format.json { render json: @signature.errors, status: :unprocessable_entity }
        @signatures = Signature.all.order(signature_cod: :asc)
        @error_signature = true
      end
    end
  end

  # PATCH/PUT /signatures/1 or /signatures/1.json
  def update
    respond_to do |format|
      if @signature.update(signature_params)
        format.html { redirect_to @signature, notice: "Signature was successfully updated." }
        format.json { render :show, status: :ok, location: @signature }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
        @signatures = Signature.all.order(signature_cod: :asc)
        @error_signature = true
      end
    end
  end

  # DELETE /signatures/1 or /signatures/1.json
  def destroy
    @signature.destroy
    respond_to do |format|
      format.html { redirect_to signatures_url, notice: "Signature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signature_params
      params.require(:signature).permit(:signature_cod, :short_name, :description)
    end
end
