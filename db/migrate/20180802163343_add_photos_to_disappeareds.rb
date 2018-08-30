class AddPhotosToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :photo, :string
  end
end
