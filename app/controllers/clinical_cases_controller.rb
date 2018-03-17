class ClinicalCasesController < ApplicationController
  before_action :set_clinical_case, only: [:show, :edit, :update, :destroy]

  # GET /clinical_cases
  # GET /clinical_cases.json
  def index
    @clinical_cases = ClinicalCase.all
  end

  # GET /clinical_cases/1
  # GET /clinical_cases/1.json
  def show
  end

  # GET /clinical_cases/new
  def new
    @clinical_case = ClinicalCase.new
  end

  # GET /clinical_cases/1/edit
  def edit
  end

  # POST /clinical_cases
  # POST /clinical_cases.json
  def create
    @clinical_case = ClinicalCase.new(clinical_case_params)

    respond_to do |format|
      if @clinical_case.save
        format.html { redirect_to @clinical_case, notice: 'Clinical case was successfully created.' }
        format.json { render :show, status: :created, location: @clinical_case }
      else
        format.html { render :new }
        format.json { render json: @clinical_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_cases/1
  # PATCH/PUT /clinical_cases/1.json
  def update
    respond_to do |format|
      if @clinical_case.update(clinical_case_params)
        format.html { redirect_to @clinical_case, notice: 'Clinical case was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinical_case }
      else
        format.html { render :edit }
        format.json { render json: @clinical_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_cases/1
  # DELETE /clinical_cases/1.json
  def destroy
    @clinical_case.destroy
    respond_to do |format|
      format.html { redirect_to clinical_cases_url, notice: 'Clinical case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_case
      @clinical_case = ClinicalCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_case_params
      params.require(:clinical_case).permit(:name, :description, :auxText)
    end
end
