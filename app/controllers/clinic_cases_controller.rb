class ClinicCasesController < ApplicationController
  before_action :set_clinic_case, only: [:show, :edit, :update, :destroy]

  # GET /clinic_cases
  # GET /clinic_cases.json
  def index
    # Use the built-in with_attached_images scope to avoid N+1
    @clinic_cases = ClinicCase.all.with_attached_images

    @clinic_cases = ClinicCase.search(params[:term])
  end

  # GET /clinic_cases/1
  # GET /clinic_cases/1.json
  def show
  end

  # GET /clinic_cases/new
  def new
    @clinic_case = ClinicCase.new
  end

  # GET /clinic_cases/1/edit
  def edit
  end

  # POST /clinic_cases
  # POST /clinic_cases.json
  def create
    @clinic_case = ClinicCase.new(clinic_case_params)

    respond_to do |format|
      if @clinic_case.save
        format.html { redirect_to @clinic_case, notice: 'Clinic case was successfully created.' }
        format.json { render :show, status: :created, location: @clinic_case }
      else
        format.html { render :new }
        format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_cases/1
  # PATCH/PUT /clinic_cases/1.json
  def update
    respond_to do |format|
      if @clinic_case.update(clinic_case_params)
        format.html { redirect_to @clinic_case, notice: 'Clinic case was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic_case }
      else
        format.html { render :edit }
        format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinic_cases/1
  # DELETE /clinic_cases/1.json
  def destroy
    @clinic_case.destroy
    respond_to do |format|
      format.html { redirect_to clinic_cases_url, notice: 'Clinic case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_case
      @clinic_case = ClinicCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_case_params
      params.require(:clinic_case).permit(:title, :clinicInformation, :description, :caseEvolution, :extraInformation, :term, images: [])
    end
end
