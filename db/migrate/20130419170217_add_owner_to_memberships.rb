class AddOwnerToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :owner, :string
  end
end
