class Item < ActiveRecord::Base
  attr_accessible :amazon_id, :name, :quantity, :reorder_threshold, :image_url

  belongs_to :user
end
