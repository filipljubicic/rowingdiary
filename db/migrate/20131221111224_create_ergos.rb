class CreateErgos < ActiveRecord::Migration
  def change
    create_table :ergos do |t|
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end
