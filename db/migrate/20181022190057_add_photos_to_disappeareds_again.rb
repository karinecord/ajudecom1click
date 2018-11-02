class AddPhotosToDisappearedsAgain < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :disappeared_photos, :string, array: true, default: []
  end
end
