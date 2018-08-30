class AddEncryptedPasswordToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :encrypted_password, :string
  end
end
