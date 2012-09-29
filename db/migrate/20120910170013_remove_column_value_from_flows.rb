class RemoveColumnValueFromFlows < ActiveRecord::Migration
  def up
    remove_column :flows, :value
  end

  def down
    add_column :flows, :value, :float
  end
end
