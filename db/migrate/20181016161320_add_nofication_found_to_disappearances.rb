class AddNoficationFoundToDisappearances < ActiveRecord::Migration[5.1]
  def change
    add_column :disappearances, :notification_found, :boolean
  end
end
