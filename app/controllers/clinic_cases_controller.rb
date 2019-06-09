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
    @clinic_case = @topic.clinic_cases.find(params[:clinic_case_id])
    @image_id = params[:image_id].to_i
  end

  # GET /clinic_cases/new
  def new
    session[:clinic_case_params] ||= {}
    session[:clinic_case_imgs] ||= []
    @clinic_case = @topic.clinic_cases.new(session[:clinic_case_params])
    @clinic_case.current_step = session[:clinic_case_step]
    if session[:clinic_case_imgs]
      attach_blobs_to_object()
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

    # In case user alerady chosen images and didn't want to change them
    if session[:clinic_case_imgs] && !params[:clinic_case][:images]
      attach_blobs_to_object()
    end

    if @clinic_case.valid?

      # In case user chosen new images, so we need to save them in a session
      if params[:clinic_case][:images]
        session[:clinic_case_imgs] = []
        @clinic_case.images.each_with_index do |image, i|
          session[:clinic_case_imgs][i] = image.signed_id
        end
        params[:clinic_case].delete(:images)
      end

      if params[:clinic_case][:image_label]
        change_hash_key_to_i()
      end

      session[:clinic_case_params].deep_merge!(params[:clinic_case].to_unsafe_h) if params[:clinic_case].to_unsafe_h
      @clinic_case = @topic.clinic_cases.new(session[:clinic_case_params])
      if session[:clinic_case_imgs]
        attach_blobs_to_object()
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
        if params[:clinic_case][:image_label]
          change_hash_key_to_i()
        end
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

  # DELETE /clinic_cases/1/show_image
  # DELETE /clinic_cases/1/show_image.json
  def delete_image
    @clinic_case = @topic.clinic_cases.find(params[:clinic_case_id])
    @image_id = params[:image_id].to_i
    respond_to do |format|
      if @clinic_case.images[@image_id].purge()
        update_hash_after_delete()
        format.html { redirect_to [@topic, @clinic_case], notice: 'Imagem do caso clínico foi excluído com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to [@topic, @clinic_case] }
        format.json { render json: @clinic_case.errors, status: :unprocessable_entity }
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

    def attach_blobs_to_object
      blobs = Array.new
      session[:clinic_case_imgs].each_with_index do |image_id, i|
        blobs.push(ActiveStorage::Blob.find_signed(image_id))
      end
      @clinic_case.images.attach(blobs)
    end

    def change_hash_key_to_i
      image_label = Hash.new
      image_description = Hash.new
      params[:clinic_case][:image_label].each do |key, label|
        image_label[key.to_i] = label
      end

      params[:clinic_case][:image_description].each do |key, description|
        image_description[key.to_i] = description
      end

      params[:clinic_case][:image_label] = {}
      params[:clinic_case][:image_label] = image_label
      params[:clinic_case][:image_description] = {}
      params[:clinic_case][:image_description] = image_description
    end

    def update_hash_after_delete
      for i in @image_id...@clinic_case.image_label.length
        if i != (@clinic_case.image_label.length - 1)
          @clinic_case.image_label[i] = @clinic_case.image_label[i+1]
          @clinic_case.image_description[i] = @clinic_case.image_description[i+1]
        end
      end
      @clinic_case.save
    end
end
