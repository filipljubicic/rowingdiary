class AddTimeToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :time, :string
  end
end
