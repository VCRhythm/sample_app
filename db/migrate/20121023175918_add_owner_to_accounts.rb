class AddOwnerToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner, :integer
  end
end
