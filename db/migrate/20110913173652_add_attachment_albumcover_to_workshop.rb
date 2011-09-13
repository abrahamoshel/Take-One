class AddAttachmentAlbumcoverToWorkshop < ActiveRecord::Migration
  def self.up
    add_column :workshops, :albumcover_file_name, :string
    add_column :workshops, :albumcover_content_type, :string
    add_column :workshops, :albumcover_file_size, :integer
    add_column :workshops, :albumcover_updated_at, :datetime
  end

  def self.down
    remove_column :workshops, :albumcover_file_name
    remove_column :workshops, :albumcover_content_type
    remove_column :workshops, :albumcover_file_size
    remove_column :workshops, :albumcover_updated_at
  end
end
