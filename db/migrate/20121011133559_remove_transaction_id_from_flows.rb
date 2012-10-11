class RemoveTransactionIdFromFlows < ActiveRecord::Migration
  def up
    remove_column :flows, :transaction_id
  end

  def down
    add_column :flows, :transaction_id, :integer
  end
end
