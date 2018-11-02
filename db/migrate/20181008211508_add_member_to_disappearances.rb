class AddMemberToDisappearances < ActiveRecord::Migration[5.1]
  def change
    add_column :disappearances, :created_by_id, :integer
    add_column :disappearances, :created_by_type, :string
    add_index :disappearances, [:created_by_type, :created_by_id]
  end
end
