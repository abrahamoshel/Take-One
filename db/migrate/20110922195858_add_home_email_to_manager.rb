class AddHomeEmailToManager < ActiveRecord::Migration
  def self.up
    add_column :managers, :homeEmail, :string
  end

  def self.down
    remove_column :managers, :homeEmail
  end
end
