class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :email
      t.string :permalink
      t.integer :clicks, :null => false, :default => 0
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
