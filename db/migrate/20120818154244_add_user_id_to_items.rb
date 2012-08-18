class AddUserIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :user_id, :integer

    change_column :items, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :items, :user_id
  end
end
