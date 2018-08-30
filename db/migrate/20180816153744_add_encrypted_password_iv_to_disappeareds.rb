class AddEncryptedPasswordIvToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :encrypted_password_iv, :string
  end
end
