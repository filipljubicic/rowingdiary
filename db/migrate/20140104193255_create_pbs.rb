class CreatePbs < ActiveRecord::Migration
  def change
    create_table :pbs do |t|
      t.string :distance
      t.string :split
      t.string :time
      t.string :date
      t.integer :rate
      t.integer :watt

      t.timestamps
    end
  end
end
