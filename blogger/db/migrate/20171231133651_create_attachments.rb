class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
