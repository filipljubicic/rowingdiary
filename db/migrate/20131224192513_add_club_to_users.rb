class AddClubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :club, :string
    add_index :users, :club
  end
end
