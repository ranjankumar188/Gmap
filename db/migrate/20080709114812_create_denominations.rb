class CreateDenominations < ActiveRecord::Migration
  def self.up
    create_table :denominations do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :denominations
  end
end
