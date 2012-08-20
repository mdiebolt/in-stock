class AddReorderThresholdToItems < ActiveRecord::Migration
  def change
    add_column :items, :reorder_threshold, :integer, :null => false, :default => 2
  end
end
