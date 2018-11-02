class RemovePhotoFromDisappeared < ActiveRecord::Migration[5.1]
  def change
    remove_column :disappeareds, :photos
  end
end
