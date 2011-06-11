class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :church_id
      t.string :title
      t.string :repete_on
      t.time  :start_at
      t.time  :end_at
      t.date  :start_date
      t.date  :end_date
      t.boolean :recurring, :default=>1
      t.integer :created_by,:updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
