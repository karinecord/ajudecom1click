class AddEmailToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :email, :string
  end
end
