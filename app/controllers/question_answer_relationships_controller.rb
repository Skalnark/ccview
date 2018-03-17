class QuestionAnswerRelationshipsController < ApplicationController
  before_action :set_question_answer_relationship, only: [:show, :edit, :update, :destroy]

  # GET /question_answer_relationships
  # GET /question_answer_relationships.json
  def index
    @question_answer_relationships = QuestionAnswerRelationship.all
  end

  # GET /question_answer_relationships/1
  # GET /question_answer_relationships/1.json
  def show
  end

  # GET /question_answer_relationships/new
  def new
    @question_answer_relationship = QuestionAnswerRelationship.new
  end

  # GET /question_answer_relationships/1/edit
  def edit
  end

  # POST /question_answer_relationships
  # POST /question_answer_relationships.json
  def create
    @question_answer_relationship = QuestionAnswerRelationship.new(question_answer_relationship_params)

    respond_to do |format|
      if @question_answer_relationship.save
        format.html { redirect_to @question_answer_relationship, notice: 'Question answer relationship was successfully created.' }
        format.json { render :show, status: :created, location: @question_answer_relationship }
      else
        format.html { render :new }
        format.json { render json: @question_answer_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_answer_relationships/1
  # PATCH/PUT /question_answer_relationships/1.json
  def update
    respond_to do |format|
      if @question_answer_relationship.update(question_answer_relationship_params)
        format.html { redirect_to @question_answer_relationship, notice: 'Question answer relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_answer_relationship }
      else
        format.html { render :edit }
        format.json { render json: @question_answer_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_answer_relationships/1
  # DELETE /question_answer_relationships/1.json
  def destroy
    @question_answer_relationship.destroy
    respond_to do |format|
      format.html { redirect_to question_answer_relationships_url, notice: 'Question answer relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_answer_relationship
      @question_answer_relationship = QuestionAnswerRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_answer_relationship_params
      params.require(:question_answer_relationship).permit(:answer_id, :question_id)
    end
end
