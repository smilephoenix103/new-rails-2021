class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_logged_in!

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @reports = Report.all
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  def chart
    # @data = "my_reports3"
  	# @dataChart = "bar"

    puts "&&&&&&&&&&&&&&&&&&&&&&STATR&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
  	@chart = Chart.all.order(id: :asc)
    puts @chart
    puts "&&&&&&&&&&&&&&&&&&&&&&END&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

    @report = Report.all
  	select_char
    select_report
    @extract_locale = extract_locale
    puts "+++++++++++++++++++++++++++++++TEST URL ++++++++++++++++++++++++++++++"
    puts select_report
    puts select_char
    puts request.original_url
    puts "****EXTRACT LOCALE*****"
    if (@extract_locale == nil)
      @extract_locale = params[:extract_locale]
    end
    puts @extract_locale
    puts params[:extract_locale]
    puts "+++++++++++++++++++++++++++++END TEST+++++++++++++++++++++++++++++++++"

  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:report, :string, :name, :description)
    end

    private
	  def select_char
	  	if (params[:chart_name] == nil || params[:chart_name] == "")
        @dataChart = "bar"
      else
        @dataChart = params[:chart_name]
      end
	  end

    # REPORTS CHAR
    def select_report
      if (params[:report_name] == nil || params[:report_name] == "")
         @data = "my_reports"
        # puts "*******************************TEST************************"
        # puts @data
        # puts "*******************************TEST************************"
      else
        @data = params[:report_name]
        puts "$$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
        # puts @data
        @report = Report.where(report: (params[:report_name]))
        puts @report
        @data_name = @report
        # puts @data_name
        puts "$$$$$$$$$$$!!!!!!!!!!TEST!!!!!!!!!!!!"
      end
    end
end
