# This is the photo table for users
class AddAttachmentPhotoToUsers < ActiveRecord::Migration
  # Uses can upload one photo for himself
  def self.up
    change_table :users do |t|
      t.has_attached_file :photo
    end
  end
  # User can delete this photo for himself
  def self.down
    drop_attached_file :users, :photo
  end
end
