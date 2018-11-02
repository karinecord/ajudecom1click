class Disappearance < ApplicationRecord
  belongs_to :disappeared, class_name: "Disappeared", foreign_key: "disappeareds_id"
  belongs_to :created_by, polymorphic: true
  validates :date, :number_police_report, :police_station, :disappearance_history, presence: true
end

