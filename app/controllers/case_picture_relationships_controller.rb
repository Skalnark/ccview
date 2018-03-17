class CasePictureRelationshipsController < ApplicationController
  before_action :set_case_picture_relationship, only: [:show, :edit, :update, :destroy]

  # GET /case_picture_relationships
  # GET /case_picture_relationships.json
  def index
    @case_picture_relationships = CasePictureRelationship.all
  end

  # GET /case_picture_relationships/1
  # GET /case_picture_relationships/1.json
  def show
  end

  # GET /case_picture_relationships/new
  def new
    @case_picture_relationship = CasePictureRelationship.new
  end

  # GET /case_picture_relationships/1/edit
  def edit
  end

  # POST /case_picture_relationships
  # POST /case_picture_relationships.json
  def create
    @case_picture_relationship = CasePictureRelationship.new(case_picture_relationship_params)

    respond_to do |format|
      if @case_picture_relationship.save
        format.html { redirect_to @case_picture_relationship, notice: 'Case picture relationship was successfully created.' }
        format.json { render :show, status: :created, location: @case_picture_relationship }
      else
        format.html { render :new }
        format.json { render json: @case_picture_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_picture_relationships/1
  # PATCH/PUT /case_picture_relationships/1.json
  def update
    respond_to do |format|
      if @case_picture_relationship.update(case_picture_relationship_params)
        format.html { redirect_to @case_picture_relationship, notice: 'Case picture relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_picture_relationship }
      else
        format.html { render :edit }
        format.json { render json: @case_picture_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_picture_relationships/1
  # DELETE /case_picture_relationships/1.json
  def destroy
    @case_picture_relationship.destroy
    respond_to do |format|
      format.html { redirect_to case_picture_relationships_url, notice: 'Case picture relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_picture_relationship
      @case_picture_relationship = CasePictureRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_picture_relationship_params
      params.require(:case_picture_relationship).permit(:picture_id, :clinical_cases_id)
    end
end
