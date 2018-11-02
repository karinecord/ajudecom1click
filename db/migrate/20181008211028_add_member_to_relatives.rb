class AddMemberToRelatives < ActiveRecord::Migration[5.1]
  def change
    add_column :relatives, :created_by_id, :integer
    add_column :relatives, :created_by_type, :string
    add_index :relatives, [:created_by_type, :created_by_id]
  end
end
