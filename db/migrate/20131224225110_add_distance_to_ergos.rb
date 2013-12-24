class AddDistanceToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :distance, :string
  end
end
