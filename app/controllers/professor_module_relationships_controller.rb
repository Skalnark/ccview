class ProfessorModuleRelationshipsController < ApplicationController
  before_action :set_professor_module_relationship, only: [:show, :edit, :update, :destroy]

  # GET /professor_module_relationships
  # GET /professor_module_relationships.json
  def index
    @professor_module_relationships = ProfessorModuleRelationship.all
  end

  # GET /professor_module_relationships/1
  # GET /professor_module_relationships/1.json
  def show
  end

  # GET /professor_module_relationships/new
  def new
    @professor_module_relationship = ProfessorModuleRelationship.new
  end

  # GET /professor_module_relationships/1/edit
  def edit
  end

  # POST /professor_module_relationships
  # POST /professor_module_relationships.json
  def create
    @professor_module_relationship = ProfessorModuleRelationship.new(professor_module_relationship_params)

    respond_to do |format|
      if @professor_module_relationship.save
        format.html { redirect_to @professor_module_relationship, notice: 'Professor module relationship was successfully created.' }
        format.json { render :show, status: :created, location: @professor_module_relationship }
      else
        format.html { render :new }
        format.json { render json: @professor_module_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professor_module_relationships/1
  # PATCH/PUT /professor_module_relationships/1.json
  def update
    respond_to do |format|
      if @professor_module_relationship.update(professor_module_relationship_params)
        format.html { redirect_to @professor_module_relationship, notice: 'Professor module relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor_module_relationship }
      else
        format.html { render :edit }
        format.json { render json: @professor_module_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_module_relationships/1
  # DELETE /professor_module_relationships/1.json
  def destroy
    @professor_module_relationship.destroy
    respond_to do |format|
      format.html { redirect_to professor_module_relationships_url, notice: 'Professor module relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_module_relationship
      @professor_module_relationship = ProfessorModuleRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_module_relationship_params
      params.require(:professor_module_relationship).permit(:case_modules_id, :professors_id)
    end
end
