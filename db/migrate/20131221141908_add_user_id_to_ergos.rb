class AddUserIdToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :user_id, :integer
    add_index :ergos, :user_id
  end
end
