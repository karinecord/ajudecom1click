class CreateTablePhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :disappeareds, :disappeared_photos

    create_table :photos do |t|
      t.string :image
      t.references :disappeared, foreign_key: true
    end
  end
end
