class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.integer :workshop_id
      t.time :apptime

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
