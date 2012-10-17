class AddKeyIdToAdjustments < ActiveRecord::Migration
  def change
    add_column :adjustments, :key_id, :integer
  end
end
