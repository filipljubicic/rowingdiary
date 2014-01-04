class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.string :distance
      t.string :BoatType
      t.string :SessionDescription
      t.string :crew
      t.string :notes

      t.timestamps
    end
  end
end
