class AddUserIdToPbs < ActiveRecord::Migration
  def change
    add_column :pbs, :user_id, :integer
    add_index :pbs, :user_id
  end
end
