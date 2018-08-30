class DashboardController < ApplicationController


  def index
    @disappeared = last_disappeared
    @disappearance = last_disappearance
    @numdisappeared = number_disappeared
    @numdisappearance = number_disappearance
    @numrelative = number_relative
  end


private

  def last_disappeared
    @disappeareds = Disappeared.order(:created_at ).limit(5)
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

end
