class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_module!

  # GET /topics
  # GET /topics.json
  def index
    @topics = @module.topics.all.with_attached_image

    @topics = @module.topics.search(params[:term])
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = @module.topics.find(params[:id])
  end

  # GET /topics/new
  def new
    @topic = @module.topics.new
  end

  # GET /topics/1/edit
  def edit
    @topic = @module.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @module.topics.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@module, @topic], notice: 'Assunto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    @topic = @module.topics.find(params[:id])

    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to [@module, @topic], notice: 'Assunto foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = @module.topics.find(params[:id])
    
    respond_to do |format|
      if @topic.destroy
        format.html { redirect_to case_module_topics_path(@module), notice: 'Assunto foi excluído com sucesso.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_module!
      @module = CaseModule.find(params[:case_module_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description, :authors, :about, :term, :image)
    end
end
