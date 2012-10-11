class AddMinimumToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :minimum, :integer
  end
end
