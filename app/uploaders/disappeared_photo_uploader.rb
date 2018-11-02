class DisappearedPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    resize_to_fit(100, 100)
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def public_id
    "disappeareds/#{model.subfolder_name}/#{Cloudinary::Utils.random_public_id}"
  end
end
