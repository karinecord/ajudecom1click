class CreateDisappeareds < ActiveRecord::Migration[5.1]
  def change
    create_table :disappeareds do |t|
      t.string :name
      t.string :nickname
      t.bigint :id_number
      t.string :cpf
      t.string :drivers_license
      t.string :date_of_birth
      t.integer :gender
      t.string :nationality
      t.string :state
      t.integer :marital_status
      t.string :address
      t.string :telephone
      t.references :relatives, foreign_key: true
      t.string :cell_phone

      t.timestamps
    end
  end
end
