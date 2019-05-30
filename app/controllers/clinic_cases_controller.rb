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
    @clinic_case =  @topic.clinic_cases.find(params[:id])
  end

  # GET /clinic_cases/1/show_image/1
  # GET /clinic_cases/1/show_image/1.json
  def show_image
    @clinic_case = @topic.clinic_cases.find(params[:id])
    @image_id = params[:image_id]
  end

  # GET /clinic_cases/new
  def new
    session[:clinic_case_params] ||= {}
    session[:clinic_case_imgs] ||= []
    @clinic_case = @topic.clinic_cases.new(session[:clinic_case_params])
    @clinic_case.current_step = session[:clinic_case_step]
    if session[:clinic_case_imgs]
      blobs = Array.new
      session[:clinic_case_imgs].each_with_index do |image_id, i|
        blobs.push(ActiveStorage::Blob.find_signed(image_id))
      end
      @clinic_case.images.attach(blobs)
    end
  end

  # GET /clinic_cases/1/edit
  def edit
    @clinic_case =  @topic.clinic_cases.find(params[:id])
  end

  # POST /clinic_cases
  # POST /clinic_cases.json
  def create
    @clinic_case = @topic.clinic_cases.new(clinic_case_params)
    @clinic_case.current_step = session[:clinic_case_step]
    if session[:clinic_case_imgs] && !params[:clinic_case][:images]
      # here how validation will work
      blobs = Array.new
      session[:clinic_case_imgs].each_with_index do |image_id, i|
        blobs.push(ActiveStorage::Blob.find_signed(image_id))
      end
      @clinic_case.images.attach(blobs)
    end

    if @clinic_case.valid?
      if params[:clinic_case][:images]
        @clinic_case.images.each_with_index do |image, i|
          session[:clinic_case_imgs][i] = image.signed_id
        end
        params[:clinic_case].delete(:images)
      end

      session[:clinic_case_params].deep_merge!(params[:clinic_case].to_unsafe_h) if params[:clinic_case].to_unsafe_h
      @clinic_case = @topic.clinic_cases.new(session[:clinic_case_params])
      if session[:clinic_case_imgs]
        # here how validation will work
        blobs = Array.new
        session[:clinic_case_imgs].each_with_index do |image_id, i|
          blobs.push(ActiveStorage::Blob.find_signed(image_id))
        end
        @clinic_case.images.attach(blobs)
      end

      @clinic_case.current_step = session[:clinic_case_step]
      if params[:back_button]
        @clinic_case.previous_step

      else
        if @clinic_case.last_step?
          @clinic_case.save       

        else
          @clinic_case.next_step
        end
      end
      
      session[:clinic_case_step] = @clinic_case.current_step
      respond_to do |format|
        if @clinic_case.new_record?
          format.html { render :new }
          format.json { render json: @clinic_case.errors, status: :unprocessable_entity }

        else
          session[:clinic_case_step] = session[:clinic_case_params] = session[:clinic_case_imgs] = nil
          format.html { redirect_to [@topic, @clinic_case], notice: 'Caso clínico foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @clinic_case }
        end
      end

    else
      if session[:clinic_case_imgs]
        blobs = Array.new
        session[:clinic_case_imgs].each_with_index do |image_id, i|
          blobs.push(ActiveStorage::Blob.find_signed(image_id))
        end
        @clinic_case.images.attach(blobs)
      end

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinic_cases/1
  # PATCH/PUT /clinic_cases/1.json
  def update
    @clinic_case =  @topic.clinic_cases.find(params[:id])
    @clinic_case.current_step = session[:clinic_case_step]
    respond_to do |format|
      if params[:back_button]
        @clinic_case.previous_step
        session[:clinic_case_step] = @clinic_case.current_step
        format.html { render :edit }
        format.json { render json: @clinic_case.errors, status: :unprocessable_entity }

      else
        if @clinic_case.update(clinic_case_params)
          if @clinic_case.last_step?
            session[:clinic_case_step] = nil
            format.html { redirect_to [@topic, @clinic_case], notice: 'Caso clínico foi atualizado com sucesso.' }
            format.json { render :show, status: :ok, location: @clinic_case }

          else
            @clinic_case.next_step
            session[:clinic_case_step] = @clinic_case.current_step
            format.html { render :edit }
            format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
          end

        else
          format.html { render :edit }
          format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /clinic_cases/1
  # DELETE /clinic_cases/1.json
  def destroy
    @clinic_case =  @topic.clinic_cases.find(params[:id])
  
    respond_to do |format|
      if @clinic_case.destroy
        format.html { redirect_to topic_clinic_cases_path(@topic), notice: 'Caso clínico foi excluído com sucesso.' }
        format.json { head :no_content }
      end
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
      params.require(:clinic_case).permit(:title, :clinicInformation, :description, :caseEvolution, :extraInformation, :term, images: [], image_label: {}, image_description: {})
    end
end
