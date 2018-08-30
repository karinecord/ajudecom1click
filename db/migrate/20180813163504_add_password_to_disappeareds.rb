class AddPasswordToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :password, :string
  end
end
