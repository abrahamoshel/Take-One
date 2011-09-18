class AddAppSelectToInterest < ActiveRecord::Migration
  def self.up
    add_column :interests, :appselect, :time
  end

  def self.down
    remove_column :interests, :appselect
  end
end
