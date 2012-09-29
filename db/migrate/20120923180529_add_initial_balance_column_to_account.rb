class AddInitialBalanceColumnToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :initial_balance, :integer
  end
end
