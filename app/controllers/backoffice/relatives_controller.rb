class Backoffice::RelativesController < ApplicationController

  before_action :authenticate_admin!

  layout "backoffice"

  before_action :set_relative, only: [:show, :edit, :edit, :destroy]

  # GET /relatives
  # GET /relatives.json
  def index
    @relatives = Relative.all.page params[:page]
  end

  # GET /relatives/1
  # GET /relatives/1.json
  def show
    @disappeareds = Disappeared.where(relatives_id: @relative.id)
  end

  # GET /relatives/new
  def new
    @relative = Relative.new

  end

  # GET /relatives/1/edit
  def edit
  end

  # POST /relatives
  # POST /relatives.json
  def create
    @relative = Relative.new(relative_params)
    @relative.created_by = current_admin

    respond_to do |format|
      if @relative.save
        format.html { redirect_to backoffice_relatives_path, notice: t('.success') }
        format.json { render :show, status: :created, location: @relative }
      else
        format.html { render :new }
        format.json { render json: @relative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatives/1
  # PATCH/PUT /relatives/1.json
  def update
    respond_to do |format|
      if @relative.update(relative_params)
        format.html { redirect_to backoffice_relatives_path(:backoffice, @relative), notice: t('.updated' ) }
        format.json { render :show, status: :ok, location: @relative }
      else
        format.html { render :edit }
        format.json { render json: @relative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatives/1
  # DELETE /relatives/1.json
  def destroy
    @relative.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_relatives_path, notice: t('.destroyed')}

      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relative
      @relative = Relative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relative_params
      params.require(:relative).permit(:relative_name, :id_number, :relative_degree, :address, :telephone, :email, :cell_phone)
    end
end
