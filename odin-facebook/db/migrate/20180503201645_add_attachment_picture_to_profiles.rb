class AddAttachmentPictureToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :profiles, :picture
  end
end
