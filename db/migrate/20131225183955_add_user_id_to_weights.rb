class AddUserIdToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :user_id, :integer
    add_index :weights, :user_id
  end
end
