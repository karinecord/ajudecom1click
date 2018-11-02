class Photo < ApplicationRecord
  belongs_to :disappeared

  mount_uploader :image, DisappearedPhotoUploader

  validates :image, presence: true

  def subfolder_name
    "#{disappeared.id}-#{name_to_url}"
  end

  def name_to_url
    disappeared.name.parameterize
  end
end