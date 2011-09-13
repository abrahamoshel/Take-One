class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.integer :employee_id
      t.integer :workshop_id
      t.integer :manager_id

      t.timestamps
    end
  end

  def self.down
    drop_table :interests
  end
end
