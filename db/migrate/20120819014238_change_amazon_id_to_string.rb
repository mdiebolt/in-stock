class ChangeAmazonIdToString < ActiveRecord::Migration
  def up
    change_column :items, :amazon_id, :string
  end

  def down
    change_column :items, :amazon_id, :integer
  end
end

