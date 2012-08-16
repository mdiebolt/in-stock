class Item < ActiveRecord::Base
  attr_accessible :name, :quantity

  belongs_to :user
end
