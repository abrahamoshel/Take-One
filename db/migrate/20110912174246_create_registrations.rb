class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :employee_id
      t.integer :workshop_id
      t.integer :manager_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
