class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.string :name
      t.string :email
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :takeingname
      t.string :takingemail

      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
