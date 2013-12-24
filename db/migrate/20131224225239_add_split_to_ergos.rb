class AddSplitToErgos < ActiveRecord::Migration
  def change
    add_column :ergos, :split, :string
  end
end
