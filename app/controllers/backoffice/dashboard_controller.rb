class Backoffice::DashboardController < ApplicationController

  before_action :authenticate_admin!

  layout "backoffice"

  def index
    @disappeared = last_disappeared
    @disappearance = last_disappearance
    @numdisappeared = number_disappeared
    @numdisappearance = number_disappearance
    @numrelative = number_relative
    @disappeared_notfication_face = last_notification_facebook
    @disappearance_notification_found = last_notification_found

  end

  private

  def last_disappeared
    @disappeareds = Disappeared.order(:created_at).limit(5)
  end

  def last_disappearance
    @disappearances = Disappeared.select('disappeareds.name', 'disappearances.date')
                          .joins(:disappearances).limit(5)
  end

  def number_disappeared
    Disappeared.count(:id)
  end

  def number_disappearance
    Disappearance.count(:id)
  end


  def number_relative
    Relative.count(:id)
  end

  def disappeared_params
    params.require(:disappeared)
        .permit(:photo)
  end

  def last_notification_facebook
    Disappeared.where(notification_face: true).order(updated_at: :desc).limit(5)
  end


  def last_notification_found
    Disappearance.where(notification_found: true).order(updated_at: :desc).limit(5)
  end

end

