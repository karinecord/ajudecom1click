class AddNotificationFaceToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :notification_face, :string
  end
end
