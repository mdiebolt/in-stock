class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.integer :quantity, :null => false, :default => 0

      t.timestamps
    end
  end
end
