class Site::Profile::DisappearedsController  < Site::ProfileController

  before_action :set_disappeared, only: [:show, :edit, :update, :destroy]
  before_action :set_relative, except: [:list]

  # GET /disappeareds
  # GET /disappeareds.json
  def index
    @disappeareds = Disappeared.where(relatives_id: params[:relative_id]).page params[:page]
  end

  def list
    @disappeareds = Disappeared.page params[:page]
  end

  # GET /disappeareds/1
  # GET /disappeareds/1.json
  def show
    # notification_email
  end

  # GET /disappeareds/new
  def new
    @disappeared = Disappeared.new
  end

  # GET /disappeareds/1/edit
  def edit
  end

  # POST /disappeareds
  # POST /disappeareds.json


  def create
    @disappeared = Disappeared.new(disappeared_params)

    @disappeared.created_by = current_member

    respond_to do |format|
      if @disappeared.save
        format.html { redirect_to site_profile_relative_disappeared_path(@relative, @disappeared), notice: t('.success') }
        format.json { render :show, status: :created, location: @disappeared }
      else
        format.html { render :new }
        format.json { render json: @disappeared.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disappeareds/1
  # PATCH/PUT /disappeareds/1.json
  def update
    respond_to do |format|
      if @disappeared.update(disappeared_params)
        format.html { redirect_to site_profile_relative_disappeared_path(@relative, @disappeared), notice: t('.updated' ) }
        format.json { render :show, status: :ok, location: @disappeared }
      else
        format.html { render :edit }
        format.json { render json: @disappeared.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disappeareds/1
  # DELETE /disappeareds/1.json
  def destroy
    @disappeared.destroy
    respond_to do |format|
      format.html { redirect_to site_profile_relative_disappeareds_path(@relative), notice: t('.destroyed')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disappeared
      @disappeared = Disappeared.find(params[:id])
    end

  def set_relative
    @relative = Relative.find(params[:relative_id])
  end

  def set_photos
    @disappeared = Disappeared.find(params[:photos_id])
  end

  def add_more_images(new_images)
    images = @disappeared.photos
    images += new_images
    @disappeared.photos = images
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def disappeared_params
      params.require(:disappeared)
          .permit(:name, :nickname,:email, :password,  :notification_face, :id_number, :cpf, :drivers_license, :date_of_birth, :gender, :nationality, :state, :marital_status, :address, :telephone, :relatives_id, :cell_phone,  {disappeared_photos:[]})
    end
end
