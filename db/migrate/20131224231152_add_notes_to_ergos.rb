class AddNotesToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :notes, :string
  end
end
