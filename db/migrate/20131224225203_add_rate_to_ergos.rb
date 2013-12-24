class AddRateToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :rate, :integer
  end
end
