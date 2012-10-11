class AddRateToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :rate, :float
  end
end
