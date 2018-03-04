class AddAcceptedToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :accepted, :boolean, default: false
  end
end
