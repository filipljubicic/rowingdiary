class AddWattsToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :watts, :string
  end
end
