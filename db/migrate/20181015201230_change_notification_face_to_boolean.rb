class ChangeNotificationFaceToBoolean < ActiveRecord::Migration[5.1]
  def change
    remove_column :disappeareds, :notification_face
    add_column :disappeareds, :notification_face, :boolean, default: false
  end
end
