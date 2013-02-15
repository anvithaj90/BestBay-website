# This is the database migration for adding photo to item
class AddAttachmentPhotoToItems < ActiveRecord::Migration
  # change the number in database when some parameters change
  def self.up
    change_table :items do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :items, :photo
  end
end
