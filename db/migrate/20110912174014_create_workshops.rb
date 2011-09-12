class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :name
      t.text :description
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
