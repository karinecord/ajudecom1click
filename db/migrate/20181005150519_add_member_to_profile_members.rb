class AddMemberToProfileMembers < ActiveRecord::Migration[5.1]
  def change
    return
    add_reference :profile_members, :member, foreign_key: true
  end
end
