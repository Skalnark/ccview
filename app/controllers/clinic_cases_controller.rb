class ClinicCasesController < ApplicationController
  before_action :set_clinic_case, only: [:show, :edit, :update, :destroy]
  before_action :set_topic!

  # GET /clinic_cases
  # GET /clinic_cases.json
  def index
    # Use the built-in with_attached_images scope to avoid N+1
    @clinic_cases = @topic.clinic_cases.all.with_attached_images

    @clinic_cases = @topic.clinic_cases.search(params[:term])
  end

  # GET /clinic_cases/1
  # GET /clinic_cases/1.json
  def show
    @image_counter = 0
    @clinic_case =  @topic.clinic_cases.find(params[:id])
  end

  # GET /clinic_cases/new
  def new
    @clinic_case =  @topic.clinic_cases.new
  end

  # GET /clinic_cases/1/edit
  def edit
    @clinic_case =  @topic.clinic_cases.find(params[:id])
  end

  # POST /clinic_cases
  # POST /clinic_cases.json
  def create
    @clinic_case = @topic.clinic_cases.new(clinic_case_params)

    respond_to do |format|
      if @clinic_case.save
        format.html { redirect_to [@topic, @clinic_case], notice: 'Caso clínico foi criado com sucesso.' }
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
    @clinic_case =  @topic.clinic_cases.find(params[:id])

    respond_to do |format|
      if @clinic_case.update(clinic_case_params)
        format.html { redirect_to [@topic, @clinic_case], notice: 'Caso clínico foi atualizado com sucesso.' }
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
    @clinic_case =  @topic.clinic_cases.find(params[:id])
    @clinic_case.destroy

    respond_to do |format|
      format.html { redirect_to topic_clinic_cases_path(@topic), notice: 'Caso clínico foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic_case
      @clinic_case =  ClinicCase.find(params[:id])
    end

    def set_topic!
      @topic = Topic.find(params[:topic_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_case_params
      params.require(:clinic_case).permit(:title, :clinicInformation, :description, :caseEvolution, :extraInformation, :term, images: [])
    end
end
