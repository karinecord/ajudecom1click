class RemovePasswordFromDisappeareds < ActiveRecord::Migration[5.1]
  def change
    remove_column :disappeareds, :password, :string
  end
end
