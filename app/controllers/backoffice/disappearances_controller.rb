require 'mail'
class Backoffice::DisappearancesController < ApplicationController

  before_action :authenticate_admin!

  layout "backoffice"

  before_action :set_disappearance, only: [:show, :edit, :update, :destroy]
  before_action :set_relative, except: [:list]
  before_action :set_disappeared, except: [:list]


  # GET /disappeareds
  # GET /disappeareds.json
  def index
    @disappearances = Disappearance.where(disappeareds_id: params[:disappeared_id]).page params[:page]
  end

  def list
    @disappearances = Disappearance.page params[:page]
  end

  # GET /disappeareds/1
  # GET /disappeareds/1.json
  def show
    @disappearances = Disappearance.find(params[:id])

  end

  # GET /disappeareds/new
  def new
    @disappearance = Disappearance.new

  end

  # GET /disappeareds/1/edit
  def edit
  end

  # POST /disappeareds
  # POST /disappeareds.json
  def create
    @disappearance = Disappearance.new(disappearance_params)
    @disappearance.created_by = current_admin

    respond_to do |format|
      if @disappearance.save
        format.html { redirect_to new_backoffice_relative_disappeared_disappearance_path(@relative,@disappeared), notice: t('.success') }
        format.json { render :show, status: :created, location: @disappearance }
      else
        format.html { render :new }
        format.json { render json: @disappearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disappeareds/1
  # PATCH/PUT /disappeareds/1.json
  def update
    respond_to do |format|
      if @disappearance.update(disappearance_params)
        format.html { redirect_to backoffice_relative_disappeared_disappearances_path(@relative, @disappeared), notice: t('.updated' ) }
        format.json { render :show, status: :ok, location: @disappearance }
      else
        format.html { render :edit }
        format.json { render json: @disappearance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disappeareds/1
  # DELETE /disappeareds/1.json
  def destroy
    @disappearance.destroy
    respond_to do |format|
      format.html { redirect_to backoffice_relative_disappeared_disappearances_path(@relative, @disappeared), notice: t('.destroyed') }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disappearance
      @disappearance = Disappearance.find(params[:id])
    end

  def set_relative
    @relative = Relative.find(params[:relative_id])
  end

  def set_disappeared
    @disappeared = Disappeared.find(params[:disappeared_id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def disappearance_params
      params.require(:disappearance).permit(:date, :hour, :notification_found, :disappeareds_id, :email, :password, :notification_face, :number_police_report, :police_station, :disappearance_history)
    end
end
