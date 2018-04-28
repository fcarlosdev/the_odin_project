class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.date :birthday
      t.string :country
      t.string :education
      t.string :profession
      t.text :about_to
      t.text :interests
      t.boolean :email_notification
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
