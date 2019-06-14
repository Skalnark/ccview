class CaseModulesController < ApplicationController
  before_action :set_case_module, only: [:show, :edit, :update, :destroy]
  before_action :set_dictionary, only: [:new, :create, :edit, :update]
  before_action :save_dictionary_on_new_session, only: [:create]
  before_action :save_dictionary_on_edit_session, only: [:update]

  # GET /case_modules
  # GET /case_modules.json
  def index
    @case_modules = CaseModule.all.with_attached_image

    @case_modules = CaseModule.search(params[:term])
  end

  # GET /case_modules/1
  # GET /case_modules/1.json
  def show
    @case_module = CaseModule.find(params[:id])
  end

  # GET /case_module/1/show_image
  # GET /case_module/1/show_image.json
  def show_image
    @case_module = CaseModule.find(params[:id])
  end

  # GET /case_modules/new
  def new
    session[:new_module_params] ||= {}
    session[:new_dicionary_bool] ||= {}
    @case_module = CaseModule.new(session[:new_module_params])
    @case_module.current_step = session[:new_module_step]
    if session[:new_module_img]
      @case_module.image.attach(ActiveStorage::Blob.find_signed(session[:new_module_img]))
    end
    @current_page = "new"
  end

  # GET /case_modules/1/edit
  def edit
    session[:edit_dicionary_bool] = {}
    @case_module.current_step = session[:edit_module_step]
    @current_page = "edit"
  end

  # POST /case_modules
  # POST /case_modules.json
  def create
    @case_module = CaseModule.new(case_module_params)
    @case_module.current_step = session[:new_module_step]
    if session[:new_module_img] && !params[:case_module][:image]
      # here how validation will work
      @blob = ActiveStorage::Blob.find_signed(session[:new_module_img])
      @case_module.image.attach(@blob)
    end

    if @case_module.valid?
      if params[:case_module][:image]
        session[:new_module_img] = @case_module.image.signed_id
        params[:case_module].delete(:image)
      end

      session[:new_module_params].deep_merge!(params[:case_module].to_unsafe_h) if params[:case_module].to_unsafe_h
      @case_module = CaseModule.new(session[:new_module_params])
      if session[:new_module_img]
        # here how validation will work
        @blob = ActiveStorage::Blob.find_signed(session[:new_module_img])
        @case_module.image.attach(@blob)
      end

      @case_module.current_step = session[:new_module_step]
      if params[:back_button]
        @case_module.previous_step

      else
        if @case_module.last_step?
          set_dictionary_to_new_module()
          @case_module.save       

        else
          @case_module.next_step
        end
      end
      
      session[:new_module_step] = @case_module.current_step
      respond_to do |format|
        if @case_module.new_record?
          @current_page = "new"
          format.html { render :new }
          format.json { render json: @case_module.errors, status: :unprocessable_entity }

        else
          session[:new_module_step] = session[:new_module_params] = session[:new_module_img] = nil
          format.html { redirect_to @case_module, notice: 'Módulo foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @case_module }
        end
      end

    else
      if session[:new_module_img]
        @blob = ActiveStorage::Blob.find_signed(session[:new_module_img])
        @case_module.image.attach(@blob)
      end

      respond_to do |format|
        @current_page = "new"
        format.html { render :new }
        format.json { render json: @case_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_modules/1
  # PATCH/PUT /case_modules/1.json
  def update
    @case_module.current_step = session[:edit_module_step]
    respond_to do |format|
      if params[:back_button]
        @case_module.previous_step
        session[:edit_module_step] = @case_module.current_step
        @current_page = "edit"
        format.html { render :edit }
        format.json { render json: @case_module.errors, status: :unprocessable_entity }

      else
        if @case_module.update(case_module_params)
          if @case_module.last_step?
            set_dictionary_to_edit_module()
            session[:edit_module_step] = nil
            format.html { redirect_to @case_module, notice: 'Módulo foi atualizado com sucesso.' }
            format.json { render :show, status: :ok, location: @case_module }

          else
            @case_module.next_step
            session[:edit_module_step] = @case_module.current_step
            @current_page = "edit"
            format.html { render :edit }
            format.json { render json: @case_module.errors, status: :unprocessable_entity }
          end

        else
          @current_page = "edit"
          format.html { render :edit }
          format.json { render json: @case_module.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /case_modules/1
  # DELETE /case_modules/1.json
  def destroy
    respond_to do |format|
      if @case_module.destroy
        format.html { redirect_to case_modules_path, notice: 'Módulo foi removido com sucesso.' }
        format.json { head :no_content }
      end
    end
  end

  public
    # Use callbacks to share common setup or constraints between actions.
    def set_case_module
      @case_module = CaseModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_module_params
      params.require(:case_module).permit(:title, :description, :author, :term, :image, :image_label, :image_description, options: [])
    end

    def set_dictionary
      @dictionaries = Dictionary.all.order('term ASC')
    end

    def save_dictionary_on_new_session
      if !params[:back_button]
        if params[:options]
          session[:new_dicionary_bool].each do |id, value|
            session[:new_dicionary_bool][id] = false
          end

          params[:options].each do |id|
            session[:new_dicionary_bool][id] = true
          end

        elsif !params[:options] && params[:case_module][:title]
          session[:new_dicionary_bool] = {}
        end
      end
    end

    def save_dictionary_on_edit_session
      if !params[:back_button]
        if params[:options]
          session[:edit_dicionary_bool].each do |id, value|
            session[:edit_dicionary_bool][id] = false
          end

          params[:options].each do |id|
            session[:edit_dicionary_bool][id] = true
          end

        elsif !params[:options] && params[:case_module][:title]
          session[:edit_dicionary_bool] = {}
        end
      end
    end

    def set_dictionary_to_new_module
      session[:new_dicionary_bool].each do |id, value|
        if value
          dic = Dictionary.find(id)
          @case_module.dictionaries << dic
        end
      end
      session[:new_dicionary_bool] = nil
    end

    def set_dictionary_to_edit_module
      session[:edit_dicionary_bool].each do |id, value|
        if value
          dic = Dictionary.find(id)
          @case_module.dictionaries << dic
        end
      end
      session[:edit_dicionary_bool] = nil
    end
end
