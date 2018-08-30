class RemoveNoticationFaceFromDisappearances < ActiveRecord::Migration[5.1]
  def change
    remove_column :disappearances, :notication_face, :string

  end
end
