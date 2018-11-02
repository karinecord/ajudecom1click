class Backoffice::DisappearedPhotosController < ApplicationController
  MAX_PHOTOS_ALLOWED = 5
  before_action :set_disappeared

  layout "backoffice"


  def create
    if photo_params[:disappeared_photo]
      if @disappeared.photos.length >= MAX_PHOTOS_ALLOWED
        flash[:alert] = "Permitido no máximo #{MAX_PHOTOS_ALLOWED} fotos!"
        return redirect_to backoffice_relative_disappeared_path(@disappeared.relative, @disappeared)
      end

      cover_attachment = @disappeared.photos.create(image: photo_params[:disappeared_photo])

      unless cover_attachment
        flash[:alert] = cover_attachment.errors.messages.map { |key, value| value }.flatten.join(' ') unless cover_attachment.errors.empty?
        flash[:alert] = t("messages.failed_uploading_images") if cover_attachment.errors.empty?
      end
      redirect_to backoffice_relative_disappeared_path(@disappeared.relative, @disappeared), notice: t('.success')
    else
      flash[:alert] = 'Vc precisa seleciona uma foto'
      redirect_to backoffice_relative_disappeared_path(@disappeared.relative, @disappeared)
    end
  end


  def destroy
    photo = @disappeared.photos.find(params[:id])
    @disappeared.photos.destroy(photo) if photo
    redirect_to backoffice_relative_disappeared_path(@disappeared.relative, @disappeared), notice: t('.deleted')
  end


  private

  def set_disappeared
    @disappeared = Disappeared.find(params[:disappeared_id])
  end


  def photo_params
    params.fetch(:disappeared, {}).permit(:disappeared_photo) # allow nested params as array
  end
end

