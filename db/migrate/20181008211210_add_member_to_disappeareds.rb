class AddMemberToDisappeareds < ActiveRecord::Migration[5.1]
  def change
    add_column :disappeareds, :created_by_id, :integer
    add_column :disappeareds, :created_by_type, :string
    add_index :disappeareds, [:created_by_type, :created_by_id]
  end
end
