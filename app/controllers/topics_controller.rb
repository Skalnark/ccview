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

  # GET /topics/1/show_image
  # GET /topics/1/show_image.json
  def show_image
    @topic = @module.topics.find(params[:id])
  end

  # GET /topics/new
  def new
    session[:new_topic_params] ||= {}
    @topic = @module.topics.new(session[:new_topic_params])
    @topic.current_step = session[:new_topic_step]
    if session[:new_topic_img]
      @topic.image.attach(ActiveStorage::Blob.find_signed(session[:new_topic_img]))
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = @module.topics.find(params[:id])
    @topic.current_step = session[:edit_topic_step]
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @module.topics.new(topic_params)
    @topic.current_step = session[:new_topic_step]
    if session[:new_topic_img] && !params[:topic][:image]
      # here how validation will work
      @blob = ActiveStorage::Blob.find_signed(session[:new_topic_img])
      @topic.image.attach(@blob)
    end

    if @topic.valid?
      if params[:topic][:image]
        session[:new_topic_img] = @topic.image.signed_id
        params[:topic].delete(:image)
      end

      session[:new_topic_params].deep_merge!(params[:topic].to_unsafe_h) if params[:topic].to_unsafe_h
      @topic = @module.topics.new(session[:new_topic_params])
      if session[:new_topic_img]
        # here how validation will work
        @blob = ActiveStorage::Blob.find_signed(session[:new_topic_img])
        @topic.image.attach(@blob)
      end

      @topic.current_step = session[:new_topic_step]
      if params[:back_button]
        @topic.previous_step

      else
        if @topic.last_step?
          @topic.save       

        else
          @topic.next_step
        end
      end
      
      session[:new_topic_step] = @topic.current_step
      respond_to do |format|
        if @topic.new_record?
          format.html { render :new }
          format.json { render json: @topic.errors, status: :unprocessable_entity }

        else
          session[:new_topic_step] = session[:new_topic_params] = session[:new_topic_img] = nil
          format.html { redirect_to [@module, @topic], notice: 'Assunto foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @topic }
        end
      end

    else
      if session[:new_topic_img]
        @blob = ActiveStorage::Blob.find_signed(session[:new_topic_img])
        @topic.image.attach(@blob)
      end

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    @topic = @module.topics.find(params[:id])
    @topic.current_step = session[:edit_topic_step]
    respond_to do |format|
      if params[:back_button]
        @topic.previous_step
        session[:edit_topic_step] = @topic.current_step
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }

      else
        if @topic.update(topic_params)
          if @topic.last_step?
            session[:edit_topic_step] = nil
            format.html { redirect_to [@module, @topic], notice: 'Assunto foi atualizado com sucesso.' }
            format.json { render :show, status: :ok, location: @topic }

          else
            @topic.next_step
            session[:edit_topic_step] = @topic.current_step
            format.html { render :edit }
            format.json { render json: @topic.errors, status: :unprocessable_entity }
          end

        else
          format.html { render :edit }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
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
      params.require(:topic).permit(:title, :description, :authors, :about, :term, :image, :image_label, :image_description)
    end
end
