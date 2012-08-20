class AddAmazonIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :amazon_id, :integer
  end
end
