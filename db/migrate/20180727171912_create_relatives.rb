class CreateRelatives < ActiveRecord::Migration[5.1]
  def change
    create_table :relatives do |t|
      t.string :relative_name
      t.bigint :id_number
      t.integer :relative_degree
      t.string :telephone
      t.string :email
      t.string :cell_phone
      t.string :address, limit: 255, null: false

      t.timestamps
    end
  end
end
