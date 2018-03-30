class AddMemberIdToAccesses < ActiveRecord::Migration[5.1]
  def change
    add_column :accesses, :member_id, :integer
  end
end
