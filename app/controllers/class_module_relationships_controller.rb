class ClassModuleRelationshipsController < ApplicationController
  before_action :set_class_module_relationship, only: [:show, :edit, :update, :destroy]

  # GET /class_module_relationships
  # GET /class_module_relationships.json
  def index
    @class_module_relationships = ClassModuleRelationship.all
  end

  # GET /class_module_relationships/1
  # GET /class_module_relationships/1.json
  def show
  end

  # GET /class_module_relationships/new
  def new
    @class_module_relationship = ClassModuleRelationship.new
  end

  # GET /class_module_relationships/1/edit
  def edit
  end

  # POST /class_module_relationships
  # POST /class_module_relationships.json
  def create
    @class_module_relationship = ClassModuleRelationship.new(class_module_relationship_params)

    respond_to do |format|
      if @class_module_relationship.save
        format.html { redirect_to @class_module_relationship, notice: 'Class module relationship was successfully created.' }
        format.json { render :show, status: :created, location: @class_module_relationship }
      else
        format.html { render :new }
        format.json { render json: @class_module_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_module_relationships/1
  # PATCH/PUT /class_module_relationships/1.json
  def update
    respond_to do |format|
      if @class_module_relationship.update(class_module_relationship_params)
        format.html { redirect_to @class_module_relationship, notice: 'Class module relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_module_relationship }
      else
        format.html { render :edit }
        format.json { render json: @class_module_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_module_relationships/1
  # DELETE /class_module_relationships/1.json
  def destroy
    @class_module_relationship.destroy
    respond_to do |format|
      format.html { redirect_to class_module_relationships_url, notice: 'Class module relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_module_relationship
      @class_module_relationship = ClassModuleRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_module_relationship_params
      params.require(:class_module_relationship).permit(:student_classes_id, :case_modules_id)
    end
end
