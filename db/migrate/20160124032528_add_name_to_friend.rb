class AddNameToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :name, :string
  end
end
