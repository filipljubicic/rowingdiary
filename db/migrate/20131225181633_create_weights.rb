class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.string :exercise
      t.string :reps
      t.string :weight
      t.string :sets
      t.text :notes

      t.timestamps
    end
    add_index :weights, :exercise
  end
end
