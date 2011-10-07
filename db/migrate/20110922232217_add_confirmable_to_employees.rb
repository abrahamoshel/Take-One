class AddConfirmableToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.confirmable
    end
    add_index :employees, :confirmation_token, :unique => true

  end

  def self.down
    remove_column :employees, :confirmable
  end
end
