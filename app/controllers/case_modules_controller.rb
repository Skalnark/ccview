class CaseModulesController < ApplicationController
  before_action :set_case_module, only: [:show, :edit, :update, :destroy]

  # GET /case_modules
  # GET /case_modules.json
  def index
    @case_modules = CaseModule.all.with_attached_image
  end

  # GET /case_modules/1
  # GET /case_modules/1.json
  def show
  end

  # GET /case_modules/new
  def new
    @case_module = CaseModule.new
    @active_module = @case_module
  end

  # GET /case_modules/1/edit
  def edit
  end

  # POST /case_modules
  # POST /case_modules.json
  def create
    @case_module = CaseModule.new(case_module_params)
    @active_module = @case_module
    respond_to do |format|
      if @case_module.save
        format.html { redirect_to @case_module, notice: 'Case module was successfully created.' }
        format.json { render :show, status: :created, location: @case_module }
      else
        format.html { render :new }
        format.json { render json: @case_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_modules/1
  # PATCH/PUT /case_modules/1.json
  def update
    respond_to do |format|
      if @case_module.update(case_module_params)
        format.html { redirect_to @case_module, notice: 'Case module was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_module }
      else
        format.html { render :edit }
        format.json { render json: @case_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_modules/1
  # DELETE /case_modules/1.json
  def destroy
    @case_module.destroy
    respond_to do |format|
      format.html { redirect_to case_modules_url, notice: 'Case module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_module
      @case_module = CaseModule.find(params[:id])
      @active_module = @case_module
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_module_params
      params.require(:case_module).permit(:title, :description, :author, :dictionary, :privacy, :image)
    end
end
