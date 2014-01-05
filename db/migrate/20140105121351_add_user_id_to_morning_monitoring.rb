class AddUserIdToMorningMonitoring < ActiveRecord::Migration
  def change
    add_column :morning_monitorings, :user_id, :integer
    add_index :morning_monitorings, :user_id
  end
end
