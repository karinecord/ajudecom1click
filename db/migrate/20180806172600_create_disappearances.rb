class CreateDisappearances < ActiveRecord::Migration[5.1]
  def change
    create_table :disappearances do |t|
      t.string :date
      t.string :hour
      t.references :disappeareds, foreign_key: true
      t.string :email
      t.string :notication_face
      t.integer :number_police_report
      t.string :police_station
      t.text :disappearance_history

      t.timestamps
    end
  end
end
