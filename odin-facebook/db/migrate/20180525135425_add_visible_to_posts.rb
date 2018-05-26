class AddVisibleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :visible, :boolean, default: true
  end
end
