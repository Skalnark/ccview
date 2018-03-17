class StudentClassRelationshipsController < ApplicationController
  before_action :set_student_class_relationship, only: [:show, :edit, :update, :destroy]

  # GET /student_class_relationships
  # GET /student_class_relationships.json
  def index
    @student_class_relationships = StudentClassRelationship.all
  end

  # GET /student_class_relationships/1
  # GET /student_class_relationships/1.json
  def show
  end

  # GET /student_class_relationships/new
  def new
    @student_class_relationship = StudentClassRelationship.new
  end

  # GET /student_class_relationships/1/edit
  def edit
  end

  # POST /student_class_relationships
  # POST /student_class_relationships.json
  def create
    @student_class_relationship = StudentClassRelationship.new(student_class_relationship_params)

    respond_to do |format|
      if @student_class_relationship.save
        format.html { redirect_to @student_class_relationship, notice: 'Student class relationship was successfully created.' }
        format.json { render :show, status: :created, location: @student_class_relationship }
      else
        format.html { render :new }
        format.json { render json: @student_class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_class_relationships/1
  # PATCH/PUT /student_class_relationships/1.json
  def update
    respond_to do |format|
      if @student_class_relationship.update(student_class_relationship_params)
        format.html { redirect_to @student_class_relationship, notice: 'Student class relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_class_relationship }
      else
        format.html { render :edit }
        format.json { render json: @student_class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_class_relationships/1
  # DELETE /student_class_relationships/1.json
  def destroy
    @student_class_relationship.destroy
    respond_to do |format|
      format.html { redirect_to student_class_relationships_url, notice: 'Student class relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_class_relationship
      @student_class_relationship = StudentClassRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_class_relationship_params
      params.require(:student_class_relationship).permit(:student_classes_id, :students_id)
    end
end
