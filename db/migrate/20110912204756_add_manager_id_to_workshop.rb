class AddManagerIdToWorkshop < ActiveRecord::Migration
  def self.up
    add_column :workshops, :manager_id, :integer
  end

  def self.down
    remove_column :workshops, :manager_id
  end
end
