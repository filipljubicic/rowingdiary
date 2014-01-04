class CreateMorningMonitorings < ActiveRecord::Migration
  def change
    create_table :morning_monitorings do |t|
      t.integer :hr
      t.integer :sleep
      t.string :notes

      t.timestamps
    end
  end
end
