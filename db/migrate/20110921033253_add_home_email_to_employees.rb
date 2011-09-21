class AddHomeEmailToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :homeEmail, :string
  end

  def self.down
    remove_column :employees, :homeEmail
  end
end
