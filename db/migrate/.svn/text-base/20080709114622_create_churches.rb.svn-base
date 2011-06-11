class CreateChurches < ActiveRecord::Migration
  def self.up
    create_table :churches do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :phone
      t.string :denomination_id
      t.string :url
      t.string :lat
      t.string :lng
      t.integer :created_by,:updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :churches
  end
end
