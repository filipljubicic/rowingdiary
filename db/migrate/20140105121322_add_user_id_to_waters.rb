class AddUserIdToWaters < ActiveRecord::Migration
  def change
    add_column :waters, :user_id, :integer
    add_index :waters, :user_id
  end
end
